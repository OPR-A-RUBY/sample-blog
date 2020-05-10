require 'rails_helper'

# RSpec.describe Contact, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

#   it 'control_error_' do
#     expect(should validate_presence_of( :email )).to eq true
#   end  
# end

RSpec.describe 'Contact' do        #
  context 'before publication' do  # (almost) plain English
    it 'cannot have email' do   #
      # expect { Contact.create.email.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      expect(Contact.create.email.present?).to eq false  # test code
    end
  end
end