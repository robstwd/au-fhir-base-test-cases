FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

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

  # this method returns whether an extension is present in a test file, at a specific parent node
  def get_extension_nodeset_present_at_node(file,extension_url,parent_node)
    doc = get_nokogiri_doc(file)
    extension_xpath = "/#{parent_node.gsub('.','/')}/extension[@url='#{extension_url}']"
    # Kernel.puts extension_xpath
    nodeset = doc.xpath(extension_xpath)
    # Kernel.puts nodeset
    return not(nodeset.empty?)
  end

  # this method returns a count of how many times an extension is present in a test file, at a specific parent node
  def get_extension_nodeset_present_at_node_count(file,extension_url,parent_node)
    doc = get_nokogiri_doc(file)
    extension_xpath = "/#{parent_node.gsub('.','/')}/extension[@url='#{extension_url}']"
    # Kernel.puts extension_xpath
    nodeset = doc.xpath(extension_xpath)
    # Kernel.puts nodeset.count
    return nodeset.count
  end

  # this method returns a boolean whether an extension is present with a specified child element
  def get_extension_nodeset_present_with_child(file, extension_url, child_element)
    doc = get_nokogiri_doc(file)
    extension_xpath = "//extension[@url='#{extension_url}']/#{child_element.gsub('.','/')}"
    # Kernel.puts extension_xpath
    nodeset = doc.xpath(extension_xpath)
    # Kernel.puts nodeset
    return not(nodeset.empty?)
  end

  # this method returns the value of an extension's specified child element
  def get_extension_nodeset_value_of_child(file, extension_url, child_element)
    doc = get_nokogiri_doc(file)
    extension_xpath = "//extension[@url='#{extension_url}']/#{child_element.gsub('.','/')}/@value"
    # Kernel.puts extension_xpath
    actual_value = doc.xpath(extension_xpath).to_s
    # Kernel.puts actual_value
    return actual_value
  end

  # this method captures the overall result summary line of the FHIR validator
  # eg "Success: 0 errors, 0 warnings, 1 notes"
  # eg "*FAILURE*: 1 errors, 0 warnings, 0 notes"
  # this returns a MatchData object (https://ruby-doc.org/core-2.6.8/MatchData.html)
  # the argument is the FHIR validator output as a string
  # regex: https://rubular.com/r/XcOYzVrUqEISiY
  def get_overall_result_summary(validator_output)
    text_to_match = %r{(\*FAILURE\*|Success): (\d+ errors)}
    return text_to_match.match(validator_output).to_s
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