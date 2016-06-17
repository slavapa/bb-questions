require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :family_name => "Family Name",
      :email => "Email1@gmail.com",
      :password_digest => "Password Digest",
      :remember_digest => "Remember Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Family Name/)
    expect(rendered).to match(/Email/)
  end
end
