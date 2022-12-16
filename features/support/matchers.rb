class NodeNotPresentError < StandardError; end
class ValidatorNotPresentError < StandardError; end


# This matcher determines if a specific extension is present in a test file
RSpec::Matchers.define :have_extension do |extension_url|

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


# this matcher determines if the FHIR validator exists at the expected path
RSpec::Matchers.define :be_accessible do

  include MatcherHelpers
  
  match do |source|

    # expected path of FHIR validator
    @validator_path = source
    # Kernel.puts @validator_path

    @error_msg = "The FHIR validator does not exist at the path '#{@validator_path}' "

    expect(File.exist?(@validator_path)).to be_truthy 

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


# This matcher determines if a specific extension is present within a specific node
RSpec::Matchers.define :have_extension_in_node do |extension_url, node|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @file_name = source
      # Kernel.puts @file_name

      # extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # the expected node that the extension is to be a child of
      @parent_node = node
      # Kernel.puts @parent_node

      # determine if extension is present
      extension_present = get_extension_nodeset_present_at_node(@file_name,@extension_url,@parent_node)
      # Kernel.puts extension_present

      @error_msg = "Expecting the test file '#{@file_name}' to include extension '#{@extension_url}' \n" \
          " within node '#{@parent_node}' - instead it was absent."

      expect(extension_present).to be_truthy
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

  failure_message_when_negated do |source|
    @error_msg = "Extension #{@extension_url} was present at node '#{@parent_node}'"
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a specific extension is present, with a given child element
RSpec::Matchers.define :have_extension_with_element do |extension_url, child_element|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @file_name = source
      # Kernel.puts @file_name

      # extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # expected child element
      @child_element = child_element
      # Kernel.puts @child_element

      # determine if extension is present
      extension_present = get_extension_nodeset_present_with_child(@file_name, @extension_url, @child_element)
      # Kernel.puts extension_present

      @error_msg = "Expecting the test file '#{@file_name}' to include extension '#{@extension_url}' \n" \
          " with child element '#{@child_element}'  \n" \
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


# This matcher determines the count of a specific extension, within a given parent node
RSpec::Matchers.define :have_extension_in_node_count do |extension_url, occurrences, parent_node|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @file_name = source
      # Kernel.puts @file_name

      # url of extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # expected occurrences
      @expected_occurrences = occurrences.to_i
      # Kernel.puts @expected_occurrences

      # parent node
      @parent_node = parent_node
      # Kernel.puts @parent_node

      # determine count of the extension
      extension_count = get_extension_nodeset_present_at_node_count(@file_name, @extension_url, @parent_node)
      # Kernel.puts extension_count

      @error_msg = "Expecting the test file '#{@file_name}' to include extension '#{@extension_url}' #{@expected_occurrences} times. \n" \
          " Instead it was present #{extension_count} times."

      expect(extension_count).to eq(@expected_occurrences )
      
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


# This matcher determines if a specific extension is present, with a given child element, and a given value
RSpec::Matchers.define :have_extension_with_element_and_value do |extension_url, child_element, value|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @file_name = source
      # Kernel.puts @file_name

      # extension being examined
      @extension_url = extension_url
      # Kernel.puts @extension_url

      # expected child element
      @child_element = child_element
      # Kernel.puts @child_element

      # expected value
      @expected_value = value
      # Kernel.puts @expected_value

      # get actual value
      @actual_nodeset_value = get_extension_nodeset_value_of_child(@file_name, @extension_url, @child_element)
      # Kernel.puts @actual_nodeset_value

      @error_msg = "Expecting the test file '#{@file_name}' to include extension '#{@extension_url}' \n" \
          " with child element '#{@child_element}' and value '#{@expected_value}'  \n" \
          " It does not."

      expect(@actual_nodeset_value).to eq(@expected_value)
      
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


# This matcher determines if the FHIR validator output contains the expected overall result
# ie failure, success
# output_result: = the expected text to find in the output
# source: the actual output message
RSpec::Matchers.define :include_output_result do |output_result|

  include MatcherHelpers

  match do |source|

    # the actual output message
    @actual_output = source
    # uncomment this to see validator output
    # Kernel.puts @actual_output

    # expected output string
    @expected_output_result = output_result
    # Kernel.puts @expected_output_result

    # capture the overall result summary line
    @result_summary = get_overall_result_summary(@actual_output)
    # Kernel.puts "result_summary: #{@result_summary}"

    @error_msg = "The validator command was expected to have the result: #{@expected_output_result} \n" \
          " Instead the result was: #{@result_summary}."

    expect(@result_summary).to include(@expected_output_result)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if the FHIR validator output contains the correct error content
# argument: resultType => the expected result type, either "Warning" or "Error"
# ie don't care in this method about clean passes
# message: the expected error/warning text to find in the output
# source: the actual output message
RSpec::Matchers.define :have_result_type_with_message do |resultType, message|

  include MatcherHelpers

  match do |source|

    # the actual output message
    @actual_output = source
    # uncomment this to see validator output
    # Kernel.puts @actual_output

    # expected result type
    @expected_resultType = resultType
    # Kernel.puts @expected_resultType

    # expected message
    @expected_message = message
    # Kernel.puts @expected_message

    # prepare failure message
    @error_msg = "The validator command did not raise the expected content: \n" \
          "   - result type: #{@expected_resultType} \n" \
          "   - message: #{@expected_message}"

    expect(@actual_output).to include(@expected_resultType).and include(@expected_message)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end