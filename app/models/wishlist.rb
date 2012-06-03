class Wishlist < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  has_many :wishlistlines, :dependent => :destroy
  
  validates :name, :length => { :within => 5..60 }
end
