Given('extension {string} is not present') do |extension_url|
  # expect(@testfile).not_to have_extension(extension_url)
end

Given('extension {string} is present') do |extension_url|
  # expect(@testfile).to have_extension(extension_url)
end

Given('extension {string} is present in node {string}') do |extension_url, node|
  expect(@testfile).to have_extension_in_node(extension_url, node)
end

Given('extension {string} is not present in node {string}') do |extension_url, node|
  expect(@testfile).not_to have_extension_in_node(extension_url, node)
end

Given('element {string} has value {string}') do |element, value|
  expect(@testfile).to have_element_with_value(element, value)
end

Given('valueDateTime extension {string} has value {string}') do |extension_url, value|
  expect(@testfile).to have_valueDateTime_extension_with_value(extension_url, value)
end

Given('extension {string} has child element {string}') do |extension_url, child_element|
  expect(@testfile).to have_extension_with_element(extension_url, child_element)
end

Given('element {string} is present') do |element|
  expect(@testfile).to have_element(element)
end

Given('element {string} is not present') do |element|
  expect(@testfile).not_to have_element(element)
end

Given('extension {string} is present {string} times in parent node {string}') do |extension_url, occurrences, parent_node|
  expect(@testfile).to have_extension_in_node_count(extension_url, occurrences, parent_node)
end