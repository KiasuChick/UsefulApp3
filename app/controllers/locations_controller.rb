class LocationsController < ApplicationController

before_action :authenticate_user
before_action :set_location, only: [:edit, :update, :show, :destroy]

def index
		@locations = Location.all
	end

	def show
  		@location = Location.find(params[:id])
  	end

	def new
		@location = Location.new
	end

	def create
		location_params()
		@location = Location.new
		@location = Location.new(location_params)
		if @location.save
			redirect_to locations_path
		else
			render 'new'
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update
		@location = Location.find(params[:id])
		if @location.update(location_params)
			redirect_to locations_path(@location)
		else
			render 'edit'
		end
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		redirect_to locations_path
	end


	def location_params
		params.require(:location).permit(:name, :address, :store_type)
	end

	def set_location
		@location = Location.find(params[:id])
	end



end
