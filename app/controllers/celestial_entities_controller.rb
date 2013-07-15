class CelestialEntitiesController < ApplicationController
  # GET /celestial_entities
  # GET /celestial_entities.json
  def index
    @celestial_entities = nil
    
    if params['entity_typeid']
      @celestial_entities = CelestialEntity.joins(:entity_subtype).where('entity_typeid = ?', params['entity_typeid'])
    else
      @celestial_entities = CelestialEntity.all

    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @celestial_entities }
    end
  end

  # GET /celestial_entities/1
  # GET /celestial_entities/1.json
  def show
    @celestial_entity = CelestialEntity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @celestial_entity }
    end
  end

  # GET /celestial_entities/new
  # GET /celestial_entities/new.json
  def new
    @celestial_entity = CelestialEntity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @celestial_entity }
    end
  end

  # GET /celestial_entities/1/edit
  def edit
    @celestial_entity = CelestialEntity.find(params[:id])
  end

  # POST /celestial_entities
  # POST /celestial_entities.json
  def create
    @celestial_entity = CelestialEntity.new(params[:celestial_entity])

    respond_to do |format|
      if @celestial_entity.save
        format.html { redirect_to @celestial_entity, notice: 'Celestial entity was successfully created.' }
        format.json { render json: @celestial_entity, status: :created, location: @celestial_entity }
      else
        format.html { render action: "new" }
        format.json { render json: @celestial_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /celestial_entities/1
  # PUT /celestial_entities/1.json
  def update
    @celestial_entity = CelestialEntity.find(params[:id])

    respond_to do |format|
      if @celestial_entity.update_attributes(params[:celestial_entity])
        format.html { redirect_to @celestial_entity, notice: 'Celestial entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @celestial_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /celestial_entities/1
  # DELETE /celestial_entities/1.json
  def destroy
    @celestial_entity = CelestialEntity.find(params[:id])
    @celestial_entity.destroy

    respond_to do |format|
      format.html { redirect_to celestial_entities_url }
      format.json { head :no_content }
    end
  end
end
