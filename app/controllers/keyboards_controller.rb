class KeyboardsController < ApplicationController

	def index
		@user = User.find_by_name(params[:user_name])
		@keyboards = @user.keyboards
	end

	def new
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.new
	end

	def show
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])
	end

	def edit
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])
	end

	def create
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.new(keyboard_params)

		@keyboard.user = User.first

		@keyboard.commits << Commit.create(name: "Initial commit", layers: [], keyboard: @keyboard)

		if @keyboard.save
			redirect_to user_keyboard_path(@user.name, @keyboard.name)
		else
			render 'new'
		end
	end

	def update
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:name])

		if @keyboard.update(keyboard_params)
		    redirect_to user_keyboard_path(@user.name, @keyboard.name)
		else
		    render 'edit'
		end
  	end

  	def destroy
  		@user = User.find_by_name(params[:user_name])
    	@keyboard = Keyboard.find_by_name(params[:name])

    	@keyboard.destroy

    	redirect_to user_keyboards_path(@user.name)
  	end


  	private
  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
