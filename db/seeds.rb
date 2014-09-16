# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(:email => 'jane@example.com', :password => 'password',
	:password_confirmation => 'password', :name => "Jane")
user.save!(:validate => false)

user = User.new(:email => 'jack@example.com', :password => 'password',
	:password_confirmation => 'password', :name => "Jack")
user.save!(:validate => false)

user = User.new(:email => 'jim@example.com', :password => 'password',
	:password_confirmation => 'password', :name => "Jim")
user.save!(:validate => false)

user = User.new(:email => 'john@example.com', :password => 'password',
	:password_confirmation => 'password', :name => "John")
user.save!(:validate => false)

post = Post.new(:title => "Lorem", :content => "Lorem ipsum", :author_id => User.first.id)
post.save

