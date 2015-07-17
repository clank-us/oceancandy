Given /^I am on the "(.*?)" page$/ do |url|
  visit url
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I press "(.*?)"$/ do |button_text|
  click_button button_text
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
  select value, from: field
end

Then /^I see "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end

Then /^I do not see "(.*?)"$/ do |content|
  expect(page).to_not have_content(content)
end
