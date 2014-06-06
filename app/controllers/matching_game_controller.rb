class MatchingGameController < ApplicationController

  def index
    @entity_types = EntityType.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end