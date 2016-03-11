class KeyboardsController < ApplicationController

	def index
		@keyboards = User.first.keyboards
	end

	def new
		@keyboard = Keyboard.new
	end

	def show
		@keyboard = Keyboard.find(params[:id])
	end

	def edit
		@keyboard = Keyboard.find(params[:id])
	end

	def create
		@keyboard = Keyboard.new(keyboard_params)

		@keyboard.user = User.first

		if @keyboard.save
			redirect_to @keyboard
		else
			render 'new'
		end
	end


	def update
		@keyboard = Keyboard.find(params[:id])

		if @keyboard.update(keyboard_params)
		    redirect_to @keyboard
		else
		    render 'edit'
		end
  	end


  	def destroy
    	@keyboard = Keyboard.find(params[:id])
    	@keyboard.destroy

    	redirect_to keyboards_path
  	end


  	private
  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
