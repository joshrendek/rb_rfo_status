require 'spec_helper'

describe "status_updates/new" do
  before(:each) do
    assign(:status_update, stub_model(StatusUpdate,
      :status => nil,
      :state => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new status_update form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => status_updates_path, :method => "post" do
      assert_select "input#status_update_status", :name => "status_update[status]"
      assert_select "input#status_update_state", :name => "status_update[state]"
      assert_select "textarea#status_update_content", :name => "status_update[content]"
    end
  end
end
