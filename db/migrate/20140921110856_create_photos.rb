class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :photo_file_name, :null => true
      t.string :photo_content_type, :null => true
      t.integer :photo_file_size, :null => true	

      t.timestamps
    end
  end

  def self.up
    add_attachment :photo, :photo
  end

  def self.down
    remove_attachment :photo, :photo
  end
end
