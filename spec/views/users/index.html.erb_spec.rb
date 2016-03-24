require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name1",
        :family_name => "Famil1",
        :email => "email1@gmail.com",
        :password => "xxxxxx",
        :password_confirmation => "xxxxxx"
      ),
      User.create!(
        :name => "Name2",
        :family_name => "Famil2",
        :email => "email2@gmail.com",
        :password_digest => "xxxxxx",
        :password_confirmation => "xxxxxx"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Famil1".to_s, :count => 1
    assert_select "tr>td", :text => "email1@gmail.com".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Famil2".to_s, :count => 1
    assert_select "tr>td", :text => "email2@gmail.com".to_s, :count => 1
  end
end
