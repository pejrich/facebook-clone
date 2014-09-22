# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all


user = User.new(:email => 'peter@example.com', :password => 'password',
	:password_confirmation => 'password', :first_name => "Peter", :last_name => "Richards")
photo = user.photos.build(:photo => File.new("/Users/pe_rich/Desktop/pjrpass.jpg", "r"), :profile_photo => true)
photo.save
photo = user.photos.build(:photo => File.new("/Users/pe_rich/Desktop/WebProgramming/The Odin Project/facebook-clone/facebook/app/assets/images/cover_default.jpg", "r"), :cover_photo => true)
photo.save
user.wall = Wall.create
user.save!(:validate => false)

user = User.new(:email => 'jack@example.com', :password => 'password',
	:password_confirmation => 'password', :first_name => "Jack", :last_name => "Doe")
user.wall = Wall.create
user.save!(:validate => false)

user = User.new(:email => 'jim@example.com', :password => 'password',
	:password_confirmation => 'password', :first_name => "Jim", :last_name => "Doe")
user.wall = Wall.create
user.save!(:validate => false)

user = User.new(:email => 'john@example.com', :password => 'password',
	:password_confirmation => 'password', :first_name => "John", :last_name => "Doe")
user.wall = Wall.create
user.save!(:validate => false)




