class EntityType < ActiveRecord::Base
  attr_accessible :name

  has_many :entity_subtypes
  has_many :celestial_entities, :through => :entity_subtype, :source => 'entity_subtypeid'

end
