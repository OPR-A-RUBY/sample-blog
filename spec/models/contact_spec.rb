require 'rails_helper'

RSpec.describe Contact do          #
  context 'before publication' do  # Название группы тестов 
    
    it 'cannot have email' do      # Первый тест: то что тестирует этот блок (1)
      # expect { Contact.create.email.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      expect(Contact.create.email.present?).to eq false  # test code
    end

    it 'something doit' do        # Второй тест: то что тестирует этот блок (2)
      expect(true).to eq true     # test code - он всегда true
    end

  end
end