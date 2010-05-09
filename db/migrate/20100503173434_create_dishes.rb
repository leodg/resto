class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.integer :category_id
      t.string :name
      t.text :desc
      t.float :price
      t.boolean :available
      t.timestamps
    end
  end
  
  def self.down
    drop_table :dishes
  end
end
