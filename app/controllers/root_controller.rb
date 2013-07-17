class RootController < ApplicationController

  def index
      lastId = CelestialEntity.last().id
      currentDay = Date.today.day
      
      if currentDay > lastId
        currentDay = currentDay % lastId
      end
      
      @celestial_entity = CelestialEntity.find(currentDay)
      
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @celestial_entity}
    end
  end

 end