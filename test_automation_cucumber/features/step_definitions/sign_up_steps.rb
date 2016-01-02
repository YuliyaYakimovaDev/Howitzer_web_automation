Given /^opened browser$/ do
  BlankPage.instance
end

Given /^home page of website/ do
  HomePage.open
end

Given /^signUp page of the website$/ do
  SignupPage.open
end

Given /^there is registered test@email.address user$/ do
  end

When /^I click on Sign Up menu item on home page$/ do
  HomePage.given.open_signup_page
end

Then /^I should be redirected to SignUp page$/ do
  SignupPage.wait_for_opened
  SignupPage.given
end

When /^I fill form on sign up page with data:$/ do |table|
  SignupPage.given.fill_form(table.rows_hash.symbolize_keys)
end

Then /^I should receive confrmation instruction email for test@email.address recipient$/ do
  end

When /^I confirm test@email.address account from confirmation instruction email$/ do
  end

When /^I submit sign up form on sign up page$/ do
  SignupPage.given.sign_up_submit
end

Then /^I shouldn't be logged in the system$/ do
   expect(SignupPage)
end

Then /^I should see following text on login page$/ do |text|
  expect(SignupPage.given.text).to include(text)
end

#Then /^I am redirected to User Page$/ do
#  UserPage.given
#end

Then /^I click Settings in dropdown menu$/ do
end

Then /^I am redirected to Identities Page$/ do

end

Then /^I should see "Approved" text for personal identity$/ do
  end


