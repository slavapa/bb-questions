require 'rails_helper'

RSpec.describe "languages/edit", type: :view do
  before(:each) do
    @language = assign(:language, Language.create!(
      :name => "MyString",
      :code => "MyString",
      :is_rtl => false
    ))
  end

  it "renders the edit language form" do
    render

    assert_select "form[action=?][method=?]", language_path(@language), "post" do

      assert_select "input#language_name[name=?]", "language[name]"

      assert_select "input#language_code[name=?]", "language[code]"

      assert_select "input#language_is_rtl[name=?]", "language[is_rtl]"
    end
  end
end
