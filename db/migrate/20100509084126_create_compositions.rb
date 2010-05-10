class CreateCompositions < ActiveRecord::Migration
  def self.up
    create_table :compositions do |t|
      t.integer :dish_id
      t.integer :ingredient_id
      t.float :quantity
      t.timestamps
    end
  end
  
  def self.down
    drop_table :compositions
  end
end
