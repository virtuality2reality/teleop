Given /^I have an "([^"]*)" account with "([^"]*)" and "([^"]*)" credentials$/ do |role, email, passwd|
  role = Role.find_by_name(role)
  Factory(:user, :roles => [ role ], :email => email, :password => passwd)
end

Given /^I am logged in as an "([^"]*)"$/ do |role|
  email = "john@doe.com"
  passwd = "secret"

  role = Role.find_by_name(role)
  Factory(:user, :roles => [ role ], :email => email, :password => passwd)
  
  visit "/"
  fill_in("Email", :with => email)
  fill_in("Password", :with => passwd)
  click_button("Login")
end
