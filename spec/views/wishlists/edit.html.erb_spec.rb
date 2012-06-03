require 'spec_helper'

describe "wishlists/edit" do
  before(:each) do
    @wishlist = assign(:wishlist, stub_model(Wishlist,
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit wishlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wishlists_path(@wishlist), :method => "post" do
      assert_select "input#wishlist_name", :name => "wishlist[name]"
      assert_select "input#wishlist_user_id", :name => "wishlist[user_id]"
    end
  end
end
