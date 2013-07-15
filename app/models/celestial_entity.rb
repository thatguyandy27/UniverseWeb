class CelestialEntity < ActiveRecord::Base
  attr_accessible :description, :mass, :name, :orbit, :rotation, :radius, :volume, :density, :gravity, :parent_id, :entity_subtypeid
  
  belongs_to :entity_subtype, class_name: "EntitySubtype", foreign_key:'entity_subtypeid'
  
  #delegate :entity_type, :to => :entity_subtype, :allow_nil => true
end
