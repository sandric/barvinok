class LayersController < ApplicationController

	def index
		query = params[:q]

		respond_to do |format|
           	format.json { render json: Commit.layers(query)}
    	end
	end

	def show
		@layer = Layer.find_by_name(params[:name])

		respond_to do |format|
           	format.json { render json: @layer.as_json}
    	end
	end

end