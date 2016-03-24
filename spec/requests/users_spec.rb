require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  subject { page }
  let(:user1) { FactoryGirl.create(:user) }
  
  before do
   log_in user1
  end
  
  
  describe "index" do
    before(:each) do
      visit users_path
    end

    it { should have_title(full_title('Users list')) }
    it { should have_content('Users list') }

  end
  
end
