class AddWallIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :wall_id, :integer
  end
end
