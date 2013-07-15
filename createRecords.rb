@@entityCache = {}
@@subtypeCache = {}

def UpsertEntityType(entityType)
  puts "Upserting #{entityType['name']}"
  existingEntityType = EntityType.find(:all, :conditions => {:name => entityType['name']})  
  if existingEntityType.length == 1
    id = existingEntityType[0].id
    puts "Found #{entityType['name']} with id #{id}"
    EntityType.update id, entityType
  else
    puts "Creating #{entityType['name']}"
    EntityType.create(entityType)
  end
end

def UpsertEntitySubtype(subtype)
  puts "Upserting #{subtype[:name]}"
  entType = @@entityCache[subtype[:entity_typeid]]
  if entType
    entType = entType.id
  end
  
  subtype[:entity_typeid] = entType
  existingSubType = EntitySubtype.find(:all, :conditions => {:name => subtype[:name]})  
  
  if existingSubType.length == 1
    puts "Found #{subtype[:name]} with id #{existingSubType[0][:id]}"
    EntitySubtype.update(existingSubType[0][:id], subtype)
  else
    puts "Creating #{subtype[:name]}"
    EntitySubtype.create(subtype)
  end  

end

def UpsertCelestialEntity(entity)
  subType = @@subtypeCache[entity[:entity_subtypeid]]
  if subType
    subType = subType.id
  end
  
  entity[:entity_subtypeid] = subType
  celestialEntity = CelestialEntity.find(:all, :conditions => {:name => entity[:name]})  
  
  if celestialEntity.length == 1
    puts "Found #{entity[:name]} with id #{celestialEntity[0][:id]}"
    CelestialEntity.update(celestialEntity[0][:id], entity)
  else
    puts "Creating #{entity[:name]}"
    CelestialEntity.create(entity)
  end  
end

puts "-----Upserting Entity Types-----"
UpsertEntityType({'name'=> "Star"})
UpsertEntityType({'name' => "Planet"})
UpsertEntityType({'name' => "Dwarf Planet"})
UpsertEntityType({'name' => "Moon"})

puts "-----Caching Entity Types-----"
@@entityCache = Hash[EntityType.find(:all).map{|ent| [ent.name, ent]}]

puts "-----Upserting Entity Subtypes-----"
UpsertEntitySubtype({:name => "Yellow Dwarf", :entity_typeid => "Star"})
UpsertEntitySubtype({:name => "Gas Giant", :entity_typeid => "Planet"})
UpsertEntitySubtype({:name => "Terrestrial", :entity_typeid => "Planet"})
UpsertEntitySubtype({:name => "Dwarf Planet", :entity_typeid => "Dwarf Planet"})
UpsertEntitySubtype({:name => "Moon", :entity_typeid => "Moon"})

puts "-----Caching Subtypes-----"
@@subtypeCache = Hash[EntitySubtype.find(:all).map{|sub| [sub.name, sub]}]

puts "-----Upserting Celestial entities-----"
UpsertCelestialEntity({:name => "Sun", :mass => 1989100000,  :rotation => 0, :orbit => 0, :radius => 696000, :volume =>1412000000, :density => 1.409, :gravity =>274.0, :entity_subtypeid => "Yellow Dwarf"})

UpsertCelestialEntity({:name => "Mercury", :mass => 330.2,  :rotation => 0, :orbit => 0, :radius => 2439.7, :volume =>60.83, :density => 5.43, :gravity =>3.7, :entity_subtypeid => "Terrestrial"})
UpsertCelestialEntity({:name => "Venus", :mass => 4868.5,  :rotation => 0, :orbit => 0, :radius => 6051.8, :volume =>928.43, :density => 5.24, :gravity =>8.872, :entity_subtypeid => "Terrestrial"})    
UpsertCelestialEntity({:name => "Earth", :mass => 5973.6,  :rotation => 0, :orbit => 0, :radius => 6371.0, :volume =>1083.21, :density => 5.515, :gravity =>9.78033, :entity_subtypeid => "Terrestrial"})    
UpsertCelestialEntity({:name => "Mars", :mass => 641.85,  :rotation => 0, :orbit => 0, :radius => 3390.0, :volume =>163.18, :density => 3.94, :gravity => 3.7, :entity_subtypeid => "Terrestrial"})    
UpsertCelestialEntity({:name => "Jupiter", :mass => 1898600,  :rotation => 0, :orbit => 0, :radius => 69911, :volume =>1431280, :density => 1.33, :gravity => 24.79, :entity_subtypeid => "Gas Giant"})    
UpsertCelestialEntity({:name => "Saturn", :mass => 568460,  :rotation => 0, :orbit => 0, :radius => 58232, :volume =>827130, :density => 0.7, :gravity =>10.445, :entity_subtypeid => "Gas Giant"})    
UpsertCelestialEntity({:name => "Uranus", :mass => 86832,  :rotation => 0, :orbit => 0, :radius => 25362, :volume =>68340, :density => 1.3, :gravity => 8.87, :entity_subtypeid => "Gas Giant"})    
UpsertCelestialEntity({:name => "Neptune", :mass => 102430,  :rotation => 0, :orbit => 0, :radius => 24622, :volume =>62540, :density => 1.76, :gravity => 11.15, :entity_subtypeid => "Gas Giant"})    

UpsertCelestialEntity({:name => "Eris", :mass => 16.7,  :rotation => 0, :orbit => 0, :radius => 1163, :volume =>7, :density => 2.5, :gravity => 0.662, :entity_subtypeid => "Dwarf Planet"})
UpsertCelestialEntity({:name => "Pluto", :mass => 13.105,  :rotation => 0, :orbit => 0, :radius => 1161, :volume =>7, :density => 2, :gravity => 0.61, :entity_subtypeid => "Dwarf Planet"})
UpsertCelestialEntity({:name => "Makemake", :mass => 3,  :rotation => 0, :orbit => 0, :radius => 740, :volume => 1.7, :density => 1.7, :gravity => 0.4, :entity_subtypeid => "Dwarf Planet"})
UpsertCelestialEntity({:name => "Haumea", :mass => 4,  :rotation => 0, :orbit => 0, :radius => 620, :volume =>1.5, :density => 2.55, :gravity => 0.44, :entity_subtypeid => "Dwarf Planet"})
UpsertCelestialEntity({:name => "Ceres", :mass => 1.52,  :rotation => 0, :orbit => 0, :radius => 471, :volume =>0.437, :density => 1.65, :gravity => 0.279 , :entity_subtypeid => "Dwarf Planet"})

UpsertCelestialEntity({:name => "Moon", :mass => 73.5,  :rotation => 0, :orbit => 0, :radius => 1737, :volume => 21.9, :density => 3.34, :gravity => 1.625 , :entity_subtypeid => "Moon"})

