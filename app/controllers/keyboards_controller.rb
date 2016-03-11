class KeyboardsController < ApplicationController

	def index
		@keyboards = Keyboard.all
	end

	def show
		@keyboard = Keyboard.find(params[:id])
	end

	def edit
		@keyboard = Keyboard.find(params[:id])
	end

	def update
		@keyboard = Keyboard.find(params[:id])

		if @keyboard.update(keyboard_params)
		    redirect_to @keyboard
		else
		    render 'edit'
		end
  	end


  	private
  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
