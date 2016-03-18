class TalksController < ApplicationController

	def index
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talks = @keyboard.talks
	end

	def new
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talk = Talk.new
	end

	def show
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talk = Talk.find(params[:id])
	end

	def edit
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talk = Talk.find(params[:id])
	end

	def create
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talk = Talk.new(talk_params)

		@talk.keyboard = @keyboard
		@talk.user = @user

		if @talk.save
			redirect_to user_keyboard_talk_path(@user.name, @keyboard.name, @talk)
		else
			render 'new'
		end
	end


	def update
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@talk = Talk.find(params[:id])

		if @talk.update(talk_params)
		    redirect_to user_keyboard_talk_path(@user.name, @keyboard.name, @talk)
		else
		    render 'edit'
		end
  	end


  	def destroy
  		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

    	@talk = Talk.find(params[:id])
    	
    	@talk.destroy

    	redirect_to user_keyboard_talks_path(@user.name, @keyboard.name)
  	end


  	private
  		def talk_params
    		params.require(:talk).permit(:title, :data)
  		end

end
