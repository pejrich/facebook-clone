class AddAboutToUser < ActiveRecord::Migration
  def change
  	add_column :users, :company, :string
  	add_column :users, :job_title, :string
  	add_column :users, :current_city, :string
  	add_column :users, :home_town, :string
  	add_column :users, :in_a_relationship, :boolean
  end
end
