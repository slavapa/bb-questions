require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :family_name => "Family Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_digest => "Remember Digest"
      ),
      User.create!(
        :name => "Name",
        :family_name => "Family Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_digest => "Remember Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Digest".to_s, :count => 2
  end
end
