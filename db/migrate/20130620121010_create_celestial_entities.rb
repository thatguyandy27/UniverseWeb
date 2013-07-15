class CreateCelestialEntities < ActiveRecord::Migration
  def change
    create_table :celestial_entities do |t|
      t.string :name
      t.string :description
      t.integer :mass
      t.integer :orbit
      t.integer :rotation

      t.timestamps
    end
  end
end
