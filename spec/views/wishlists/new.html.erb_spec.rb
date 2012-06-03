require 'spec_helper'

describe "wishlists/new" do
  before(:each) do
    assign(:wishlist, stub_model(Wishlist,
      :name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new wishlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wishlists_path, :method => "post" do
      assert_select "input#wishlist_name", :name => "wishlist[name]"
      assert_select "input#wishlist_user_id", :name => "wishlist[user_id]"
    end
  end
end
