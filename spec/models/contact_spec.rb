require 'rails_helper'

RSpec.describe Contact, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'control_error_' do
    expect(should validate_presence_of( :email )).to eq true
  end  
end
