require 'rails_helper'

RSpec.describe "app_setup_types/index", type: :view do
  before(:each) do
    assign(:app_setup_types, [
      AppSetupType.create!(
        :id => 1,
        :name => "Name",
        :description => "Description"
      ),
      AppSetupType.create!(
        :id => 1,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of app_setup_types" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
