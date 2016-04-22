require 'rails_helper'

RSpec.describe "application_setups/edit", type: :view do
  before(:each) do
    @application_setup = assign(:application_setup, ApplicationSetup.create!(
      :app_setup_type => nil,
      :language => nil,
      :code_id => "MyString",
      :description => "MyString",
      :str_value => "MyString"
    ))
  end

  it "renders the edit application_setup form" do
    render

    assert_select "form[action=?][method=?]", application_setup_path(@application_setup), "post" do

      assert_select "input#application_setup_app_setup_type_id[name=?]", "application_setup[app_setup_type_id]"

      assert_select "input#application_setup_language_id[name=?]", "application_setup[language_id]"

      assert_select "input#application_setup_code_id[name=?]", "application_setup[code_id]"

      assert_select "input#application_setup_description[name=?]", "application_setup[description]"

      assert_select "input#application_setup_str_value[name=?]", "application_setup[str_value]"
    end
  end
end
