require 'spec_helper'

describe "statuses/index" do
  before(:each) do
    assign(:statuses, [
      stub_model(Status,
        :title => "Title",
        :duration => 1,
        :environment_affected => "Environment Affected",
        :closed => false
      ),
      stub_model(Status,
        :title => "Title",
        :duration => 1,
        :environment_affected => "Environment Affected",
        :closed => false
      )
    ])
  end

  it "renders a list of statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Environment Affected".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
