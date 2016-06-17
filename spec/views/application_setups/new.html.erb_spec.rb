require 'rails_helper'

RSpec.describe "application_setups/new", type: :view do
  before(:each) do
    assign(:application_setup, ApplicationSetup.new(
      :app_setup_type => nil,
      :language => nil,
      :code_id => "MyString",
      :description => "MyString",
      :str_value => "MyString"
    ))
  end

  it "renders new application_setup form" do
    render

    assert_select "form[action=?][method=?]", application_setups_path, "post" do

      assert_select "input#application_setup_app_setup_type_id[name=?]", "application_setup[app_setup_type_id]"

      assert_select "input#application_setup_language_id[name=?]", "application_setup[language_id]"

      assert_select "input#application_setup_code_id[name=?]", "application_setup[code_id]"

      assert_select "input#application_setup_description[name=?]", "application_setup[description]"

      assert_select "input#application_setup_str_value[name=?]", "application_setup[str_value]"
    end
  end
end
