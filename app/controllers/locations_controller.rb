class LocationsController < ApplicationController
	def new
		@location = Location.new
		@location = Location.all
	end
	def create
		location_params = params.require(:location).permit(:name, :slug)
		location = location.new(location_params)
	end
	def show
		@location = Location.friendly.find(params[:id])
		if params[:tag]
			@posts = @location.posts.tagged_with(params[:tag])
		else
			@posts = @location.posts
		end
	end
end
