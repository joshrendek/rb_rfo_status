require 'spec_helper'

describe "settings/index" do
  before(:each) do
    assign(:settings, [
      stub_model(Setting,
        :setting_key => "Setting Key",
        :setting_value => "Setting Value"
      ),
      stub_model(Setting,
        :setting_key => "Setting Key",
        :setting_value => "Setting Value"
      )
    ])
  end

  it "renders a list of settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Setting Key".to_s, :count => 2
    assert_select "tr>td", :text => "Setting Value".to_s, :count => 2
  end
end
