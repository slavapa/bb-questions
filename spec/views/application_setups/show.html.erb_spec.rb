require 'rails_helper'

RSpec.describe "application_setups/show", type: :view do
  before(:each) do
    @application_setup = assign(:application_setup, ApplicationSetup.create!(
      :app_setup_type => nil,
      :language => nil,
      :code_id => "Code",
      :description => "Description",
      :str_value => "Str Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Str Value/)
  end
end
