class TalksController < ApplicationController

	before_filter :get_user_and_keyboard
	before_filter :get_talk, :except => [:index, :new, :create]


	def index
		@talks = @keyboard.talks
	end

	def new
		@talk = Talk.new
	end

	def show
	end

	def edit
	end

	def create
		@talk = Talk.new(talk_params)

		@talk.keyboard = @keyboard
		@talk.user = @user

		if @talk.save
			redirect_to [@user, @keyboard, @talk]
		else
			render 'new'
		end
	end


	def update
		if @talk.update(talk_params)
		    redirect_to [@user, @keyboard, @talk]
		else
		    render 'edit'
		end
  	end


  	def destroy
    	@talk.destroy

    	redirect_to [@user, @keyboard]
  	end


  	private
		def get_user_and_keyboard
			@user = User.friendly.find(params[:user_id])
			@keyboard = @user.keyboards.friendly.find(params[:keyboard_id])
  		end

		def get_talk
			@talk = @keyboard.talks.find(params[:id])
  		end

  		def talk_params
    		params.require(:talk).permit(:title, :data)
  		end

end
