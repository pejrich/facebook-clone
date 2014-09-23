require 'spec_helper'

describe "Users" do

	subject { page }
  
  describe "Not signed in" do
  	before { visit root_path }

  	it { should have_content('Log in') }
  	it { should have_title('Facebook') }
  end

  describe "User" do 
  	before { @user = User.new(first_name: "Example", last_name: "User", 
  														email: "example@example.com", password: "password") }

  	subject { @user }

	  describe "when name is not present" do
	  	before {@user.first_name = ""}
	  	it {should_not be_valid}
	  end

	  describe "when email is not present" do
	  	before {@user.email = ""}
	  	it {should_not be_valid}
	  end

	  describe "Signed in" do
	  	it {should respond_to(:name)}
	  	it {should respond_to(:email)}
	  	it {should respond_to(:password)}
	  	it {should respond_to(:profile_photo)}
	  	it {should respond_to(:cover_photo)}
	  	it {should respond_to(:photos)}
	  	it {should respond_to(:friends)}
	  	it {should respond_to(:friendships)}

	  	it {should be_valid}
	  end
	end
end
