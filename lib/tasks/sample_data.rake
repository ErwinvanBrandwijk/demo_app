require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships
    make_wishlists
    make_wishlistlines
  end
end

def make_users
  admin = User.create!(:name => "Example User",
      :email => "example@railstutorial.org",
      :password => "foobar",
      :password_confirmation => "foobar")
  admin.toggle!(:admin)
  normal = User.create!(:name => "Normal User",
      :email => "erwinvanbrandwijk@gmail.com",
      :password => "foobar",
      :password_confirmation => "foobar")

  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
          :email => email,
          :password => password,
          :password_confirmation => password)
  end
end
  
def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.microposts.create!(:content => content)
    end
  end
end

def make_relationships
  users = User.all
  user = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

def make_wishlists
  User.all(:limit => 6).each do |user|
    5.times do
      name = Faker::Name.name
      user.wishlists.create!(:name => name)
    end
  end
end

def make_wishlistlines
  Wishlist.all(:limit => 15).each do |wishlist|
    5.times do |n|
      name = Faker::Name.name
      price = Random.rand(1...42)
      wishlist.wishlistlines.create!(:name => name, :quantity => 5, :price => price, :bought => 3)
    end
  end
end