class AddNewFieldsToCelestialEntities < ActiveRecord::Migration
  def change
    add_column :celestial_entities, :radius, :integer 
    add_column :celestial_entities, :volume, :double 
    add_column :celestial_entities, :density, :double 
    add_column :celestial_entities, :gravity, :double 
    add_column :celestial_entities, :parent_id, :integer 
    add_column :celestial_entities, :entity_subtypeid, :integer
  end
end
