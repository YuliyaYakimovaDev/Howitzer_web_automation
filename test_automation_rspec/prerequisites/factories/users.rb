FactoryGirl.define do
  factory :user do
    email { "u#{Gen.serial}@#{settings.mailgun_domain}" }
    first_name { "First Name #{Gen.serial}" }
    last_name { "Last Name #{Gen.serial}" }
    password { settings.def_test_pass }
    password2 { settings.def_test_pass }
  end
end
