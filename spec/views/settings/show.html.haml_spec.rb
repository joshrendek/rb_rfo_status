require 'spec_helper'

describe "settings/show" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :setting_key => "Setting Key",
      :setting_value => "Setting Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Setting Key/)
    rendered.should match(/Setting Value/)
  end
end
