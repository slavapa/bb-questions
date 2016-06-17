require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  subject { page }
  let(:user1) { FactoryGirl.create(:admin) }
  
  before do
    log_in user1
    @rows_before = User.count
  end
  
  describe "index" do
    before(:each) do
      visit users_path
    end

    it { should have_title(full_title('Users list')) }
    it { should have_content('Users list') }

  end
  
  describe "index page" do
      let(:num_of_rows) {25 - @rows_before}
      before do
        visit users_path
      end

      it { expect(current_path).to eq(users_path)}
      it { should have_title(full_title('Users list')) }
      it { should have_content('Users list') }
      
      it { should_not have_selector('div.alert') }
      it { should_not have_selector('*.translation_missing') }
      
      it { should have_link('new_link_header', text: 'New', href: new_user_path) }
      it { should have_link('clear_link_header', text: 'Clear') }
      it { should have_link('search_link_header', text: 'Search') }

      it { should have_selector "form#search-form label[for='f_name']", text: "Name" }
      it { should have_selector("form#search-form input#f_name")}

      it { should have_selector "form#search-form label[for='f_family_name']", text: "Family Name" }
      it { should have_selector("form#search-form input#f_family_name")}

      it { should have_selector "form#search-form label[for='f_sort_params_for']", text: "Sort By" }
      it { should have_selector("form#search-form select#f_sort")}

      
      describe "should list all Users" do
          before  do
              num_of_rows.times do |n|
                  user = FactoryGirl.create(:user)
              end
              visit users_path
          end

          it "User count" do
              expect(User.count).to eq(num_of_rows + @rows_before)
          end

          it "should list each role" do
              User.all.each_with_index do |item, index|
                  expect(page).to have_selector("table.table-index td", text: item.email.to_s)
              end
          end
      end

      describe "click New link button should brings new page" do
          before {click_link("New")}
          it{expect(current_path).to eq(new_user_path)}
      end

      describe "click link button should brings Editing page" do
          before {click_link(user1.name)}
          it { expect(current_path).to eq(
              edit_user_path(user1))}
      end

      pending "Search functionality"
  end


  describe "User creation" do
      before { visit new_user_path }

      it { expect(current_path).to eq(new_user_path)}
         
      it { should_not have_selector('div.alert') }
      it { should_not have_selector('*.translation_missing') }
      
      it { should have_selector "div.header-title", text: "New User" }
      it { should have_content('New User') }
      it { should have_link('list_link_header', href: users_path) }
      it { should have_link('save_link_header') }

      it { should have_selector "form label[for='user_name']", text: "Name" }    
      it  {should have_field 'user_name'}  
      
      it { should have_selector "form label[for='user_family_name']", text: "Family Name" }    
      it  {should have_field 'user_family_name'} 
    
      it { should have_selector "form label[for='user_email']", text: "Email" }    
      it  {should have_field 'user_email'} 
      
      it { should have_selector "form label[for='user_password']", text: "Password" }    
      it  {should have_field 'user_password'} 
    
      it { should have_selector "form label[for='user_password_confirmation']", text: "Password" }    
      it  {should have_field 'user_password_confirmation'} 
      
      it { should have_selector "form .label_checkbox", text: "Admin" }    
      it  {should have_field 'user_admin'} 
     
      describe "with invalid information" do
          before do
              page.find("#new_user").submit_form!
          end
          it "should not create a User with empty person" do
              expect(User.count).to eq(@rows_before)
              should have_selector('.alert-error')
              should have_content('error')
          end
      end

      describe "with valid information"  do
          before do
            fill_in 'user_name', with: 'newvaliduser'
            fill_in 'user_email', with: 'newvaliduser@gmail.com'
            fill_in 'user_password', with: 'xxxxxx'
            fill_in 'user_password_confirmation', with: 'xxxxxx'
          end

          it "should create a User" do
              expect { page.find("#new_user").submit_form! }.to(
                          change(User, :count).by(1))
          end
      end

      describe "with person that alrady exists" do
          before do
            fill_in 'user_name', with: 'newvaliduser'
            fill_in 'user_email', with: user1.email
            fill_in 'user_password', with: 'xxxxxx'
            fill_in 'user_password_confirmation', with: 'xxxxxx'
            page.find("#new_user").submit_form!
          end
          it "should not create a User with the same email" do
              expect(User.count).to eq(@rows_before)
              should have_selector('.alert-error')
              should have_content('Email has already been taken')
          end
      end

      describe "click List link should brings index page" do
          before {click_link("List")}
          it {expect(current_path).to eq(users_path)}
      end
  end



  describe "Editing User" do
      before { visit edit_user_path(user1) }

      it { expect(current_path).to eq(edit_user_path(user1))}
        
      it { should_not have_selector('div.alert') }
      it { should_not have_selector('*.translation_missing') }
      
      it { should have_title(full_title('Editing User Profile')) }
      it { should have_selector "div.header-title", text: "Editing User Profile" }
      it { should have_link('list_link_header', href: users_path) } 
      it { should have_link('new_link_header', text: 'New', href: new_user_path) }
      it { should have_link('delete_link_header', text: 'Delete', href: user_path(user1)) }
      it { should have_link('save_link_header', text: 'Save') }
      

      it { should have_selector "form label[for='user_name']", text: "Name" }    
      it  {should have_field 'user_name'}  
      
      it { should have_selector "form label[for='user_family_name']", text: "Family Name" }    
      it  {should have_field 'user_family_name'} 
    
      it { should have_selector "form label[for='user_email']", text: "Email" }    
      it  {should have_field 'user_email'} 
      
      it { should have_selector "form label[for='user_password']", text: "Password" }    
      it  {should have_field 'user_password'} 
    
      it { should have_selector "form label[for='user_password_confirmation']", text: "Password" }    
      it  {should have_field 'user_password_confirmation'} 
      
      it { should have_selector "form .label_checkbox", text: "Admin" }    
      it  {should have_field 'user_admin'} 

      describe "with name invalid information" do
          before do
              fill_in 'user_name', with: ""
              page.find(".edit_user").submit_form!
          end
          it "should not update a User with empty name" do
              should have_selector('.alert-error')
              should have_content("Name can't be blank")
          end
      end
      
      describe "with email blank" do
          before do
              fill_in 'user_email', with: ""
              page.find(".edit_user").submit_form!
          end
          it "should not update a User with empty name" do
              should have_selector('.alert-error')
              should have_content("Email can't be blank")
          end
      end

      describe "with valid name information"  do
          before do
              fill_in 'user_name', with: "AnotherName"
              page.find(".edit_user").submit_form!
          end

          it "should create aDepartmentPersonRole" do
              should have_selector('.alert-success')
              should have_content('User was successfully updated')
          end
      end

      # describe "with person that alrady exists" do
      #     before do
      #         page.select @department1.name, :from => 'Department'
      #         page.select @role1.name, :from => 'Role'
      #         fill_in 'department_person_role_person_full_name',
      #             with: "#{@person1.name} #{@person1.family_name}"
      #         page.find(".edit_department_person_role").submit_form!
      #     end
      #     it "should not Update a DepartmentPersonRole" do
      #         should have_selector('.alert-error')
      #         should have_content('The combination of Department, Person and Role already in use')
      #     end
      # end

      # describe "click List link should brings index page" do
      #     before {click_link("List")}
      #     it {expect(current_path).to eq(department_person_roles_path(lng))}
      # end

      # describe "click New link button should brings new page" do
      #     before {click_link("New")}
      #     it{expect(current_path).to eq(new_department_person_role_path(lng))}
      # end

      # describe "click Delete link button should brings index page" do
      #     before {click_link("Delete")}
      #     it{expect(current_path).to eq(department_person_roles_path(lng))}
      #     it {expect(DepartmentPersonRole.count).to eq(@rows_before-1)}
      # end
  end
  
end
