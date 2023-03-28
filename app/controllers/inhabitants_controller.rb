class InhabitantsController < ApplicationController
  def index
    @inhabitants = Inhabitant.all
  end
end