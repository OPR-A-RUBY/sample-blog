require "rails_helper"

feature "Account Creation" do
  scenario "allows guest to create account" do
    visit new_user_registration_path            # посетим страницу через хелпер

    fill_in :user_username, with: 'FooBar'      # внесём данные в форму
    fill_in :user_email, with: 'foo@bar.com'
    fill_in :user_password, with: '1234567'
    fill_in :user_password_confirmation, with: '1234567'

    click_button 'Sign up'                      # нажмём кнопку
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
    # будем ожидать на странице надпись из локализации (см. в файле: config/locales/devise.en.yml)
  end
end