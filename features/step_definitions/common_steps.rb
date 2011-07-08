When /^I click on (the last)? "([^"]*)"(?: within the "([^"]*)" (.+))?$/ do |last, link, container, selector|
  xpath = (container && selector) ? "//#{selector}[contains(., '#{container}')]" : "*"
  within(:xpath, xpath) do
    f = all(:xpath, ".//a[contains(., '#{link}')]").last
    f.click
  end
end

When /^I click on the last "([^"]*)"(?: within the "([^"]*)" (.+))?$/ do |link, container, selector|
  xpath = (container && selector) ? "//#{selector}[contains(., '#{container}')]" : "*"
  within(:xpath, xpath) do
    f = all(:xpath, ".//a[contains(., '#{link}')]").last
    f.click
  end
end

When /^(?:|I )fill in the last "([^"]*)" with "([^"]*)"$/ do |field, value|
  f = page.all(:xpath, "//div[contains(@class, 'input') and contains(., '#{field}')]").last
  f.fill_in field, :with => value
end