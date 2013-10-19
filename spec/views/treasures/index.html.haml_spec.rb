require 'spec_helper'

describe "treasures/index" do
  before(:each) do
    assign(:treasures, [
      stub_model(Treasure,
        :description => "MyText"
      ),
      stub_model(Treasure,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of treasures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end