require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :name => "MyString",
      :from => "MyString",
      :ip => "MyString",
      :banned => false,
      :selected => false,
      :approved => false,
      :sequence => "",
      :question => "MyText",
      :translation => "MyText",
      :reformed => "MyText"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_name[name=?]", "question[name]"

      assert_select "input#question_from[name=?]", "question[from]"

      assert_select "input#question_ip[name=?]", "question[ip]"

      assert_select "input#question_banned[name=?]", "question[banned]"

      assert_select "input#question_selected[name=?]", "question[selected]"

      assert_select "input#question_approved[name=?]", "question[approved]"

      assert_select "input#question_sequence[name=?]", "question[sequence]"

      assert_select "textarea#question_question[name=?]", "question[question]"

      assert_select "textarea#question_translation[name=?]", "question[translation]"

      assert_select "textarea#question_reformed[name=?]", "question[reformed]"
    end
  end
end
