class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.caption     :string
      t.video_url   :string
      t.user_id     :integer
      t.gig_id      :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
