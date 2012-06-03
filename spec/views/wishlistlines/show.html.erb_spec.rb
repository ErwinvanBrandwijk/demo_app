require 'spec_helper'

describe "wishlistlines/show" do
  before(:each) do
    @wishlistline = assign(:wishlistline, stub_model(Wishlistline,
      :name => "Name",
      :quantity => 1,
      :price => "",
      :bought => 2,
      :wishlist_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
