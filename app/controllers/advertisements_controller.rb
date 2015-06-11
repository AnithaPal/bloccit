class AdvertisementsController < ApplicationController
  def index
    
    @advertisements = Advertisement.all
  end

  def show
  end
end
