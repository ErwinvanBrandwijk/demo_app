require 'spec_helper'

describe "wishlistlines/index" do
  before(:each) do
    assign(:wishlistlines, [
      stub_model(Wishlistline,
        :name => "Name",
        :quantity => 1,
        :price => "",
        :bought => 2,
        :wishlist_id => 3
      ),
      stub_model(Wishlistline,
        :name => "Name",
        :quantity => 1,
        :price => "",
        :bought => 2,
        :wishlist_id => 3
      )
    ])
  end

  it "renders a list of wishlistlines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
