class EntitySubtype < ActiveRecord::Base
  attr_accessible :name, :entity_typeid

  has_many :celestial_entities, :foreign_key=>'entity_subtypeid'
  
  belongs_to :entity_type
end
