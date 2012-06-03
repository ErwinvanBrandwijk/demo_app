class CreateWishlistlines < ActiveRecord::Migration
  def change
    create_table :wishlistlines do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.integer :bought
      t.integer :wishlist_id, :precision => 5, :scale => 2, :null => false, :default => 0

      t.timestamps
    end
    add_index :wishlistlines, :wishlist_id
  end
end
