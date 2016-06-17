require 'rails_helper'

RSpec.describe User, type: :model do
  
  before { @person = User.new(name: "Example User", 
              email: "user@example.com", 
              password: "xxxxxx", password_confirmation: "xxxxxx", admin: true )}
              
  subject { @person }
  it { should be_valid }
  
  
  describe "User's attributes" do    
    it { should respond_to(:name) } 
    it { should respond_to(:family_name) }
    it { should respond_to(:email) }
    it { should respond_to(:admin) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:remember_digest) }
    it { should be_admin }
  end
     
  describe "person authenticate" do
    it { should respond_to(:authenticate) }
  end
  
  describe "remember digest" do
    before { @person.save }
    it(:remember_digest) { should_not be_blank }
  end  
   
  describe "with admin attribute set to 'false'" do
    before do
      @person.save!
      @person.toggle!(:admin)
    end
    it { should_not be_admin }
  end
  
  describe "when person name is not present" do
    before { @person.name = nil }
    it { should_not be_valid }    
  end
  
  describe "when emial name is not present but password is not blank" do
    before { @person.email = nil }
    it { should_not be_valid }    
  end
  
  
  def get_invalid_email_arr
    %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
  end
  
  def get_valid_email_arr
    %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  end
   
  describe "when email format is invalid" do
    it "should be invalid" do
      get_invalid_email_arr().each do |invalid_eaddress|
        @person.email = invalid_eaddress
        expect(@person).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      get_valid_email_arr().each do |valid_eaddress|
        @person.email = valid_eaddress
        expect(@person).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @person.dup
      user_with_same_email.email = @person.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  
  
  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @person.email = mixed_case_email
      @person.save
      expect(@person.reload.email).to eq mixed_case_email.downcase
    end
  end
  
  describe "when password doesn't match confirmation" do
    before { @person.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
    before { @person.password = @person.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  
  
  describe "return value of authenticate method" do
    before { @person.save }
    let(:user1) { User.find_by(email: @person.email) }

    describe "with valid password" do
      it { should eq user1.authenticate(@person.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { user1.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_falsey }
    end
  end
  
  
  describe "when name is too long" do
    before { @person.name = "a" * 61 }
    it { should_not be_valid }
  end
  
  describe "when family name is too long" do
    before { @person.family_name = "a" * 61 }
    it { should_not be_valid }
  end
    
  describe "when email name is too long" do
    before { @person.email = "a" * 256 }
    it { should_not be_valid }
  end
  
end
