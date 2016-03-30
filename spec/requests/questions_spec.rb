require 'rails_helper'

RSpec.describe "Questions", type: :request do
  
  # describe "GET /questions" do
  #   it "works! (now write some real specs)" do
  #     get questions_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
  
  
  subject { page }
  let(:user1) { FactoryGirl.create(:admin) }
  
  before do
    log_in user1
    @rows_before = Question.count
  end
   
  describe "index page" do
      let(:num_of_rows) {25 - @rows_before}
      before do
        visit questions_path
      end

      it { expect(current_path).to eq(questions_path)}
      it { should have_title(full_title('Questions list')) }
      it { should have_content('Questions list') }
      
      it { should_not have_selector('div.alert') }
      it { should_not have_selector('*.translation_missing') }
      
      it { should have_link('new_link_header', text: 'New', href: new_question_path) }
      it { should have_link('clear_link_header', text: 'Clear') }
      it { should have_link('search_link_header', text: 'Search') }

      it { should have_selector "form#search-form label[for='f_name']", text: "Name" }
      it { should have_selector("form#search-form input#f_name")}
      
      it { should have_selector "form#search-form label[for='f_from']", text: "From" }
      it { should have_selector("form#search-form input#f_from")}
      
      it { should have_selector "form#search-form label[for='f_ip']", text: "IP" }
      it { should have_selector("form#search-form input#f_ip")}
      
      it { should have_selector "form#search-form label[for='f_question']", text: "Question" }
      it { should have_selector("form#search-form input#f_question")}
        
      it { should have_selector "form#search-form label[for='f_approved']", text: "Approved" }
      it { should have_selector("form#search-form select#f_approved")}

      it { should have_selector "form#search-form label[for='f_banned']", text: "Banned" }
      it { should have_selector("form#search-form select#f_banned")}
      
      # describe "should list all Users" do
      #     before  do
      #         num_of_rows.times do |n|
      #             user = FactoryGirl.create(:user)
      #         end
      #         visit users_path
      #     end

      #     it "User count" do
      #         expect(User.count).to eq(num_of_rows + @rows_before)
      #     end

      #     it "should list each role" do
      #         User.all.each_with_index do |item, index|
      #             expect(page).to have_selector("table.table-index td", text: item.email.to_s)
      #         end
      #     end
      # end

      # describe "click New link button should brings new page" do
      #     before {click_link("New")}
      #     it{expect(current_path).to eq(new_user_path)}
      # end

      # describe "click link button should brings Editing page" do
      #     before {click_link(user1.name)}
      #     it { expect(current_path).to eq(
      #         edit_user_path(user1))}
      # end

      # pending "Search functionality"
  end
  
end
