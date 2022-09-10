Given('extension {string} is not present') do |extension_url|
  expect(@testfile).not_to have_extension(extension_url)
end

Given('extension {string} is present') do |extension_url|
  expect(@testfile).to have_extension(extension_url)
end

Given('element {string} has value {string}') do |element, value|
  expect(@testfile).to have_element_with_value(element, value)
end

Given('valueDateTime extension {string} has value {string}') do |extension_url, value|
  expect(@testfile).to have_valueDateTime_extension_with_value(extension_url, value)
end

Given('element {string} is present') do |element|
  expect(@testfile).to have_element(element)
end

Given('element {string} is not present') do |element|
  expect(@testfile).not_to have_element(element)
end