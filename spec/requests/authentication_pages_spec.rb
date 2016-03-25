require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  let(:lng) { I18n.default_locale }
  subject { page }
#   let(:user1) { FactoryGirl.create(:user) }
 
  describe "log_in page" do
    
    before(:each) do
      visit login_path
    end
 
    it { should_not have_selector('div.alert') }
    it { should_not have_selector('*.translation_missing') }
        
    it { should have_link('Home', root_path) }     
    it { should have_link('About', about_path) }       
    it { should have_link('Contact us', contact_us_path) }    
    it { should have_link('Log in', login_path) }
    it { should_not have_link('Sign out',    href: logout_path) }
        
    it  {should have_content('Log in')}    
    it  {should have_title(full_title('Log in'))} 
    
    it  {should have_content 'Email'}    
    it  {should have_field 'session_email'}  
      
    it  {should have_content 'Remember me on this computer'}    
    it  {should have_field 'session_remember_me'}    
    
    it  {should have_content 'Password'}    
    it  {should have_field 'session_password'}    
    it  {should have_button 'btn_log_in'}  
    
    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_title(full_title('Log in')) }
      it { should have_selector("div.alert-danger", :text => "Invalid email/password combination".to_s, :count => 1)}
    end
    
    describe "with valid information" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in "session_email",    with: admin.email.upcase
        fill_in "session_password", with: admin.password
        click_button "btn_log_in"
      end
      
      it { should_not have_selector('div.alert') }
      it { should_not have_selector('*.translation_missing') }
      it { should have_title(full_title('Users list')) }
      it { should have_link('Sign out',    href: logout_path()) }
      it { should_not have_link('Log in', href: login_path()) }
      it { should have_link('Users list', href: users_path()) }
            
      describe "after visiting another page" do
        before { click_link "Profile" }
        it { should_not have_selector('div.alert') }
      end
      
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Log in', login_path) }
        it { should_not have_link('Sign out',    href: logout_path) }
      end
    end
  end 

 
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:admin) { FactoryGirl.create(:admin) }

      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_user_path(admin) }
          it { should have_title(full_title('Log in')) }
          
          describe "visiting the person index" do
            before { visit users_path }
            it { should have_title(full_title('Log in')) }
          end
        end

        describe "submitting to the update action" do
          before { patch user_path(admin) }
          specify { expect(response).to redirect_to(login_path) }
        end
        
      end
      
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(admin)
          fill_in "session_email",    with: admin.email
          fill_in "session_password", with: admin.password
          click_button "btn_log_in"
        end

        describe "after signing in" do
          it "should render the desired protected page" do
            expect(page).to have_title(full_title('Editing User Profile'))
          end
        end
      end
    
    
     
      
      describe "in the People controller" do
        describe "submitting to the create action" do
          let(:user) {FactoryGirl.create(:user, admin:false)}
          before { post users_path }
          specify { expect(response).to redirect_to(login_path) }
        end

        describe "submitting to the destroy action" do
          let(:user) {FactoryGirl.create(:user, admin:false)}
          before {delete user_path(user) } 
          specify { expect(response).to redirect_to(login_path) }
        end
      end
      
    end
   
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user, admin:false) }
      let(:wrong_user) { FactoryGirl.create(:admin, email: "wrong@example.com") }
      before { log_in user, no_capybara: true }

      describe "submitting a GET request to the Person#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match('Editing User Profile') }
        specify { expect(response).to redirect_to(login_path) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(login_path) }
      end
    end
 
    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user, admin:false) }
      let(:non_admin) { FactoryGirl.create(:user, admin:false) }

      before { log_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(login_path) }
      end
    end
    
    # describe "as admin user" do
    #     let(:user) { FactoryGirl.create(:user, admin:false) }
    #     let(:admin1) { FactoryGirl.create(:admin) }
   
    #     before do 
    #         log_in admin1
    #     end

    #     describe "submitting a DELETE request to the Users#destroy action" do
    #         before do 
    #             delete user_path(user)
    #         end
        
    #         specify { expect(response).to redirect_to(users_path) }
    #     end
    # end
  end
   
end