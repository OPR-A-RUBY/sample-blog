require "rails_helper"

feature "Contact creation" do
  scenario "allows acess to contacts page" do
    visit new_contacts_path

    expect(page).to have_content 'Contacts page'
  end
end

# feature "..." do
#   scenario "..." do

#   end
# end