class LayersController < ApplicationController

	def index
		query = params[:q]

		respond_to do |format|
           	format.json { render json: Commit.layers(query)}
    	end
	end

	def show
		@layer = @keyboard.commits.layer(params[:id])

		respond_to do |format|
           	format.json { render json: @layer.as_json}
    	end
	end

end