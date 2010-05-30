class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :crypted_password
      t.string :persistence_token
      t.integer :login_count
      t.timestamps :current_login_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
