require 'spec_helper'

describe "settings/edit" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :setting_key => "MyString",
      :setting_value => "MyString"
    ))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path(@setting), :method => "post" do
      assert_select "input#setting_setting_key", :name => "setting[setting_key]"
      assert_select "input#setting_setting_value", :name => "setting[setting_value]"
    end
  end
end
