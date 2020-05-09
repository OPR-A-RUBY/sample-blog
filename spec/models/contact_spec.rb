require "spec_helper" do

	describe Contact do

	 it { should validate_presence_of :email }
   # должно проверять наличие адреса_электронной_почты

  end
   
end  