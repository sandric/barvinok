class LayersController < ApplicationController

	def index
		query = params[:q]

		respond_to do |format|
           	format.json { render json: Layer.layers_path_from_suggestion(query) }
    	end
	end

	def show
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:keyboard_name])
		@commit = @keyboard.commits.find(params[:commit_id])

		@layer = @commit.layers.find_by_name(params[:name])

		respond_to do |format|
           	format.json { render json: @layer.as_json }
    	end
	end

	def base
		@base_layer_name = params[:name]

		respond_to do |format|
           	format.json { render json: Layer.send("#{@base_layer_name}_layer") }
    	end
	end

end