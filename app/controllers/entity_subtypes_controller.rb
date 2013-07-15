class EntitySubtypesController < ApplicationController
  # GET /entity_subtypes
  # GET /entity_subtypes.json
  def index
    @entity_subtypes = EntitySubtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entity_subtypes }
    end
  end

  # GET /entity_subtypes/1
  # GET /entity_subtypes/1.json
  def show
    @entity_subtype = EntitySubtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entity_subtype }
    end
  end

  # GET /entity_subtypes/new
  # GET /entity_subtypes/new.json
  def new
    @entity_subtype = EntitySubtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity_subtype }
    end
  end

  # GET /entity_subtypes/1/edit
  def edit
    @entity_subtype = EntitySubtype.find(params[:id])
  end

  # POST /entity_subtypes
  # POST /entity_subtypes.json
  def create
    @entity_subtype = EntitySubtype.new(params[:entity_subtype])

    respond_to do |format|
      if @entity_subtype.save
        format.html { redirect_to @entity_subtype, notice: 'Entity subtype was successfully created.' }
        format.json { render json: @entity_subtype, status: :created, location: @entity_subtype }
      else
        format.html { render action: "new" }
        format.json { render json: @entity_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entity_subtypes/1
  # PUT /entity_subtypes/1.json
  def update
    @entity_subtype = EntitySubtype.find(params[:id])

    respond_to do |format|
      if @entity_subtype.update_attributes(params[:entity_subtype])
        format.html { redirect_to @entity_subtype, notice: 'Entity subtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entity_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_subtypes/1
  # DELETE /entity_subtypes/1.json
  def destroy
    @entity_subtype = EntitySubtype.find(params[:id])
    @entity_subtype.destroy

    respond_to do |format|
      format.html { redirect_to entity_subtypes_url }
      format.json { head :no_content }
    end
  end
end
