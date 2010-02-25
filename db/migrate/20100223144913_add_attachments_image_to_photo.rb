class AddAttachmentsImageToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :image_file_name, :string
    add_column :photos, :image_content_type, :string
    add_column :photos, :image_file_size, :integer
    add_column :photos, :image_updated_at, :datetime
    
    add_column :photos, :user_id, :integer
    add_column :photos, :gig_id, :integer
  end

  def self.down
    remove_column :photos, :gig_id
    remove_column :photos, :user_id
    remove_column :photos, :image_file_name
    remove_column :photos, :image_content_type
    remove_column :photos, :image_file_size
    remove_column :photos, :image_updated_at
  end
end
