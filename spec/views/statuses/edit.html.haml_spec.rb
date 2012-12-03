require 'spec_helper'

describe "statuses/edit" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :title => "MyString",
      :duration => 1,
      :environment_affected => "MyString",
      :closed => false
    ))
  end

  it "renders the edit status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statuses_path(@status), :method => "post" do
      assert_select "input#status_title", :name => "status[title]"
      assert_select "input#status_duration", :name => "status[duration]"
      assert_select "input#status_environment_affected", :name => "status[environment_affected]"
      assert_select "input#status_closed", :name => "status[closed]"
    end
  end
end
