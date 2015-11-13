class LocationsController < ApplicationController
	def new
		@location = Location.new
	end
	def create
		location_params = params.require(:location).permit(:name)
		location = location.new(location_params)
	end
end
