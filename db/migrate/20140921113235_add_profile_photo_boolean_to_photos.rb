class AddProfilePhotoBooleanToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :profile_photo, :boolean
  	add_column :photos, :cover_photo, :boolean
  end
end
