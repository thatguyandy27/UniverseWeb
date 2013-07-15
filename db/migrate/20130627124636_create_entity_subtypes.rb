class CreateEntitySubtypes < ActiveRecord::Migration
  def change
    create_table :entity_subtypes do |t|
      t.string :name
      t.integer :entity_typeid
      
      t.timestamps
    end
  end
end
