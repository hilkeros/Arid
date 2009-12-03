class RenameMailingAdress < ActiveRecord::Migration
  def self.up
    rename_table :mailing_adresses, :mailing_addresses
  end

  def self.down
    rename_table :mailing_addresses, :mailing_adresses
  end
end
