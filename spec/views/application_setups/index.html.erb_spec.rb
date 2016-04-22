require 'rails_helper'

RSpec.describe "application_setups/index", type: :view do
  before(:each) do
    assign(:application_setups, [
      ApplicationSetup.create!(
        :app_setup_type => nil,
        :language => nil,
        :code_id => "Code",
        :description => "Description",
        :str_value => "Str Value"
      ),
      ApplicationSetup.create!(
        :app_setup_type => nil,
        :language => nil,
        :code_id => "Code",
        :description => "Description",
        :str_value => "Str Value"
      )
    ])
  end

  it "renders a list of application_setups" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Str Value".to_s, :count => 2
  end
end
