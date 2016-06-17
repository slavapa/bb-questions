require 'rails_helper'

RSpec.describe "app_setup_types/show", type: :view do
  before(:each) do
    @app_setup_type = assign(:app_setup_type, AppSetupType.create!(
      :id => 1,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
