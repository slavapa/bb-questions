require 'rails_helper'

RSpec.describe "app_setup_types/edit", type: :view do
  before(:each) do
    @app_setup_type = assign(:app_setup_type, AppSetupType.create!(
      :id => 1,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit app_setup_type form" do
    render

    assert_select "form[action=?][method=?]", app_setup_type_path(@app_setup_type), "post" do

      assert_select "input#app_setup_type_id[name=?]", "app_setup_type[id]"

      assert_select "input#app_setup_type_name[name=?]", "app_setup_type[name]"

      assert_select "input#app_setup_type_description[name=?]", "app_setup_type[description]"
    end
  end
end
