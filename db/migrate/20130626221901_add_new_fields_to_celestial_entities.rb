class AddNewFieldsToCelestialEntities < ActiveRecord::Migration
  def change
    add_column :celestial_entities, :radius, :integer 
    add_column :celestial_entities, :volume, :decimal 
    add_column :celestial_entities, :density, :decimal 
    add_column :celestial_entities, :gravity, :decimal 
    add_column :celestial_entities, :parent_id, :integer 
    add_column :celestial_entities, :entity_subtypeid, :integer
  end
end
