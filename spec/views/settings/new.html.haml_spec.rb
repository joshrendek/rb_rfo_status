require 'spec_helper'

describe "settings/new" do
  before(:each) do
    assign(:setting, stub_model(Setting,
      :setting_key => "MyString",
      :setting_value => "MyString"
    ).as_new_record)
  end

  it "renders new setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path, :method => "post" do
      assert_select "input#setting_setting_key", :name => "setting[setting_key]"
      assert_select "input#setting_setting_value", :name => "setting[setting_value]"
    end
  end
end
