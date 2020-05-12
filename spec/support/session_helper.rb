def sign_up
  visit new_user_registration_path            # посетим страницу через хелпер

  fill_in :user_username, :with => 'FooBar2'      # внесём данные в форму
  fill_in :user_email, :with => 'foo2@bar.com'
  fill_in :user_password, :with => '1234567'
  fill_in :user_password_confirmation, :with => '1234567'

  click_button 'Sign up'
end