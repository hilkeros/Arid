class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.caption     :string
      t.image_url   :string
      t.user_id     :integer
      t.gig_id      :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
