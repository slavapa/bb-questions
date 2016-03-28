require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :name => "Name",
        :from => "From",
        :ip => "Ip",
        :banned => false,
        :selected => false,
        :approved => false,
        :sequence => "",
        :question => "MyText",
        :translation => "MyText",
        :reformed => "MyText"
      ),
      Question.create!(
        :name => "Name",
        :from => "From",
        :ip => "Ip",
        :banned => false,
        :selected => false,
        :approved => false,
        :sequence => "",
        :question => "MyText",
        :translation => "MyText",
        :reformed => "MyText"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
