class PlacesController < ApplicationController
skip_before_filter  :verify_authenticity_token
# # this code allowed me to skip an error that said, "Can't verify CSRF token authenticity."
  def index
    @places = Place.all
  end

  def create
    @place = params['place']
    Place.create(name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'],
                  user_id: 1)
    redirect_to("/places")
  end

  def edit
    @info = Place.find_by(id: params[:id])
  end

  def destroy
    Place.destroy(params['id'])
    redirect_to("/places")
  end

  def show
    @place = Place.find_by(id: params[:id])
  end

  def update
    @place = params['place']
    Place.update( params['id'],
                  name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'],
                  user_id: 1)

    redirect_to("/places")
  end

end
