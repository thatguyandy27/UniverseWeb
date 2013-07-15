class RootController < ApplicationController

  def index
    @celestial_entities = CelestialEntity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @celestial_entities }
    end
  end

end