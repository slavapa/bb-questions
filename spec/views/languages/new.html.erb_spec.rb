require 'rails_helper'

RSpec.describe "languages/new", type: :view do
  before(:each) do
    assign(:language, Language.new(
      :name => "MyString",
      :code => "MyString",
      :is_rtl => false
    ))
  end

  it "renders new language form" do
    render

    assert_select "form[action=?][method=?]", languages_path, "post" do

      assert_select "input#language_name[name=?]", "language[name]"

      assert_select "input#language_code[name=?]", "language[code]"

      assert_select "input#language_is_rtl[name=?]", "language[is_rtl]"
    end
  end
end
