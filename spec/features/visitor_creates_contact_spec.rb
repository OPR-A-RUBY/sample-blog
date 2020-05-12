require "rails_helper"

# feature "..." do
#   scenario "..." do
#      ...
#   end
# end

feature "Contact creation" do
  
  # Позволить доступ к странице контактов (отправки сообщений)
  scenario "allows access to contacts page" do
    visit new_contacts_path # посетим страницу по пути указанному в переменной_пути

    expect(page).to have_content I18n.t('contacts.contact_us')
    # ожидаем на странице надпись из файла локализации по имени переменной: contacts.contact_us
  end
  
  # Позволить доступ гостю для создания контакта (создание сообщения)
  scenario "allows a guest to create contact" do 
    visit '/contacts' # посетим страницу /contacts

    # вносим в поля (по идентификатору) формы указанные здесь значения (любые)
    fill_in :contact_email, :with => 'user@example.com' # contact_email это идентификатор поля в форме
    fill_in :contact_message, :with => 'somephing'
    
    click_button 'Send message' # нажатие кнопки (отправка данных из формы)

    expect(page).to have_content 'Your message is sended' 
    # ождаем на странице надпись: Your message is sended
  end

end
