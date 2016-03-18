class KeyboardsController < ApplicationController

	def index
		@user = User.first
		@keyboards = User.first.keyboards
	end

	def new
		@user = User.find(params[:user_id])
		@keyboard = Keyboard.new
	end

	def show
		@keyboard = Keyboard.find(params[:id])
	end

	def edit
		@keyboard = Keyboard.find(params[:id])
	end

	def create
		@user = Keyboard.find(params[:user_id])
		@keyboard = Keyboard.new(keyboard_params)

		@keyboard.user = User.first

		@keyboard.commits << Commit.create(name: "Initial commit", layers: [], keyboard: @keyboard)

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
    	user = @keyboard.user

    	@keyboard.destroy

    	redirect_to user_keyboards_path(user)
  	end


  	private
  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
