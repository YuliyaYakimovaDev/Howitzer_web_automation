require 'tur'
step "signUp page of the website" do
  BlankPage.instance
  SignupPage.open
end

step "I fill form on sign up page with data" do
  SignupPage.given.fill_form("test@email.address", "yuliya", "test", "12345678", "12345678")
end

step "I should receive confrmation instruction email for test@email.address recipient" do
end

step "I confirm test@email.address account from confirmation instruction email" do
end

step "I submit sign up form on sign up page" do
  SignupPage.given.sign_up_submit
end

step "I shouldn't be logged in the system" do
  expect(SignupPage).to have_content("Sign Up for nCrypted Cloud")
end

step "I should see following1 text on login page" do
  expect(LoginPage.given.text).to include("A verification email message is sent to test@email.address! Please follow instructions in the email to complete your account creation.")
end

step "I should see following text2 on login page" do
  expect(LoginPage.given.text).to include("This field is required.")
end

step "I should see following text3 on login page" do
  expect(LoginPage.given.text).to include("Ensure this value has at least 8 characters (it has 3).")
end

step "I should see following text4 on login page" do
  expect(LoginPage.given.text).to include("Password fields did not match")
end

step "I should see following text5 on login page" do
  expect(LoginPage.given.text).to include("Email already exists in our system")
end

step "I am redirected to User Page" do
  UserPage.given
end

step "I click Settings in dropdown menu" do
end

step "I am redirected to Identities Page" do

end

step "I should see Approved text for personal identity" do
end

#RSpec.configure { |c| c.include SignUPSteps, sign_up_steps: true }
