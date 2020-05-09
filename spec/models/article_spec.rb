require "spec_helper" do

	describe Contact do

    describe "validations" do
      it { should validate_presence_of :title }
	    it { should validate_presence_of :text }   
    end

    describe "associations" do
      it { should have_many :comments }
    end

  end

end