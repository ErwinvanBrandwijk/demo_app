require 'spec_helper'

describe "wishlistlines/edit" do
  before(:each) do
    @wishlistline = assign(:wishlistline, stub_model(Wishlistline,
      :name => "MyString",
      :quantity => 1,
      :price => "",
      :bought => 1,
      :wishlist_id => 1
    ))
  end

  it "renders the edit wishlistline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wishlistlines_path(@wishlistline), :method => "post" do
      assert_select "input#wishlistline_name", :name => "wishlistline[name]"
      assert_select "input#wishlistline_quantity", :name => "wishlistline[quantity]"
      assert_select "input#wishlistline_price", :name => "wishlistline[price]"
      assert_select "input#wishlistline_bought", :name => "wishlistline[bought]"
      assert_select "input#wishlistline_wishlist_id", :name => "wishlistline[wishlist_id]"
    end
  end
end
