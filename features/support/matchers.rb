
FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

class NodeNotPresentError < StandardError; end

module MatcherHelpers

  def get_nokogiri_doc(file)
    return File.open(file) { |f| Nokogiri::XML(f) }.remove_namespaces!
  end

  # this method returns whether an extension is present in a test file
  # it doesn't verify *where* the extension appears only whether it does
  def get_extension_nodeset_present(file,extension_url)
    doc = get_nokogiri_doc(file)
    extension_xpath = "//extension[@url='#{extension_url}']"
    # Kernel.puts extension_xpath
    nodeset = doc.xpath(extension_xpath)
    # Kernel.puts nodeset
    return not(nodeset.empty?)
  end

  # this method captures the error message summary line of the FHIR validator, if present (ie when a failure actually occurs)
  # eg "*FAILURE*: 1 errors, 0 warnings, 0 notes"
  # this returns a MatchData object (https://ruby-doc.org/core-2.6.8/MatchData.html)
  # the argument is the FHIR validator output as a string
  def get_validator_error_summary(validator_output)
    text_to_match = %r{(\*FAILURE\*:(.*))}
    return text_to_match.match(validator_output)     
  end

  def print_failure_message(error_msg)
    "#{FAILURE_MESSAGE_START}" \
    "#{error_msg}" \
    "#{FAILURE_MESSAGE_END}"
  end

  # this method retuns a nodeset from a test file, specifying an element
  # arguments 
  #   - testfile under examination (relative location ie 'test/CodeSystem/codesystem-hl7au-csd-base-02-fail-01.xml')
  #   - the element under examination, in full FHIR Resource.element notation ie 'CodeSystem.url'
  #     (the FHIR notation is converted into xpath for Nokogiri)
  def get_element_nodeset(testfile, element)
    doc = get_nokogiri_doc(testfile)
    # Kernel.puts doc
    element_xpath = "/#{element.gsub('.','/')}"
    # Kernel.puts element_xpath
    # Kernel.puts doc.xpath(element_xpath)
    return doc.xpath(element_xpath)
  end

  # this method retuns a nodeset from a test file, specifying an extension
  def get_extension_nodeset(testfile_name, extension_url, value_type)
    doc = get_nokogiri_doc(testfile_name)

    extension_xpath = "//extension[@url='#{extension_url}']/#{value_type}"
    # Kernel.puts extension_xpath
    nodeset = doc.xpath(extension_xpath)
    # Kernel.puts nodeset

    return nodeset

  end

end

# This matcher determines if a specific extension is present in a test file
RSpec::Matchers.define :have_extension do |extension_url, valueType|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @file_name = source
      # Kernel.puts @file_name

      # extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # determine if extension is present
      extension_present = get_extension_nodeset_present(@file_name,@extension_url)
      # Kernel.puts extension_present

      @error_msg = "Expecting the test file '#{@file_name}' to include extension '#{@extension_url}' \n" \
          " Instead it was absent."

      expect(extension_present).to be_truthy
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

  failure_message_when_negated do |source|
    @error_msg = "Extension #{@extension_url} was present"
    print_failure_message(@error_msg)
  end

end


# This matcher determines if the FHIR validator output contains the correct content
# argument: status = the expected result as pass or fail
# output_string: = the expected text to find in the output
# source: the actual output message
RSpec::Matchers.define :include_correct_content do |status, output_string| # element_name, value

  include MatcherHelpers

  match do |source|

    # the actual output message
    @actual_output = source
    # uncomment this to see validator output
    # Kernel.puts @actual_output

    # expected command status
    @expected_status = status
    # Kernel.puts @expected_status

    # expected output string
    @expected_output_string = output_string
    # Kernel.puts @expected_output_string

    # prepare first line of the failure message, which is identical for the failure and success scenarios
    @error_msg_first_line = "The validator command was expected to #{@expected_status} containing message: #{@expected_output_string} \n"

    # when the validator is expected to succeed
    if @expected_status == "succeed" 

      # capture the error message summary line, if one exists
      @error_summary = get_validator_error_summary(@actual_output)

      # check that there actually is an error line and if not, do nothing
      if not @error_summary.nil?

        # error message gets constructed of
        # 1) pre-prepared first line
        # 2) the single line of the error summary (MatchData.to_s)
        # 3) and a full output of the validator errors (MatchData.post_match with chomp to remove the extra empty line)
        @error_msg = "#{@error_msg_first_line}" \
            " Instead it failed with the message: #{@error_summary.to_s} \n" \
            "#{@error_summary.post_match.chomp}"
      end

    # however if the validator is expected to fail but instead it succeeds
    # output this instead
    elsif @expected_status == "fail" 
      @error_msg = "#{@error_msg_first_line}" \
          " Instead it passed."
    end

    expect(@actual_output).to include(@expected_output_string)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element in a test file has a specific value
RSpec::Matchers.define :have_element_with_value do |element_name, value|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # element being examined
      @element_name = element_name
      # Kernel.puts @element_name

      # expected value
      @expected_value = value
      # Kernel.puts @expected_value

      # get xml value in nodeset
      nodeset = get_element_nodeset(@testfile_name,@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?, nodeset.class

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else

          # get the value
          @actual_value = nodeset.xpath("@value").to_s
          # Kernel.puts @actual_value

          @error_msg = "The test file '#{@testfile_name}' has the incorrect value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_value}'\n" \
          " - instead found:      '#{@actual_value}'"

          expect(@actual_value).to eq(@expected_value)
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given valueDateTime extension in a test file has a specific value
RSpec::Matchers.define :have_valueDateTime_extension_with_value do |extension_url, value|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # expected value
      @expected_value = value
      # Kernel.puts @expected_value

      # value type
      @value_type = "valueDateTime"
      # Kernel.puts @value_type

      # get xml value in nodeset
      nodeset = get_extension_nodeset(@testfile_name, @extension_url, @value_type)
      # Kernel.puts nodeset.length, nodeset.empty?, nodeset.class

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else

          # get the value
          @actual_value = nodeset.xpath("@value").to_s
          # Kernel.puts @actual_value

          @error_msg = "The test file '#{@testfile_name}' has the incorrect value for extension: #{@extension_url} \n" \
          " - expected:           '#{@expected_value}'\n" \
          " - instead found:      '#{@actual_value}'"

          expect(@actual_value).to eq(@expected_value)
      end
      
    rescue NodeNotPresentError
      @error_msg = "Extension '#{@extension_url}' not present"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# this matcher determines if a given file exists in the expected directory
RSpec::Matchers.define :be_in_testcase_directory do

  include MatcherHelpers
  
  match do |source|

    # file under test
    @testfile_name = source
    @file_full_path = "#{Dir.pwd}/#{@testfile_name}"
    # Kernel.puts @file_full_path

    @error_msg = "The test case '#{@testfile_name}' does not exist in the expected directory"

    expect(File.exist?(@file_full_path)).to be_truthy 

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element is present in a test file
RSpec::Matchers.define :have_element do |element_name|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # element being examined
      @element_name = element_name
      # Kernel.puts @element_name

      # get xml value in nodeset
      nodeset = get_element_nodeset(@testfile_name,@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      @error_msg = "Expecting the test file '#{@testfile_name}' to include #{@element_name} \n" \
          " Instead found it absent."

      expect(nodeset.empty?).not_to be_truthy

    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

  failure_message_when_negated do |source|
    @error_msg = "Element #{@element_name} was present"
    print_failure_message(@error_msg)
  end

end