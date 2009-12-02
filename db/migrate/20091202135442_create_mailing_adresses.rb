class CreateMailingAdresses < ActiveRecord::Migration
  def self.up
    create_table :mailing_adresses do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :mailing_adresses
  end
end
