class Wishlistline < ActiveRecord::Base
  attr_accessible :bought, :name, :price, :quantity, :wishlist_id
  
  belongs_to :wishlist
  
  validates :name, :length => { :within => 3..50 }
  validates :quantity, :presence => true
  validates :price, :presence => true
end
