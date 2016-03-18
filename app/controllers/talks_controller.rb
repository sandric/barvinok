class TalksController < ApplicationController

	def index
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talks = @keyboard.talks
	end

	def new
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.new(keyboard: @keyboard)
	end

	def show
		@talk = Talk.find(params[:id])
	end

	def edit
		@talk = Talk.find(params[:id])
	end

	def create
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.new(talk_params)

		@talk.keyboard = @keyboard
		@talk.user = User.first

		if @talk.save
			redirect_to talk_path(@talk)
		else
			render 'new'
		end
	end


	def update
		@talk = Talk.find(params[:id])

		if @talk.update(talk_params)
		    redirect_to talk_path(@talk)
		else
		    render 'edit'
		end
  	end


  	def destroy
    	@talk = Talk.find(params[:id])
    	keyboard = @talk.keyboard

    	@talk.destroy

    	redirect_to keyboard_talks_path(keyboard)
  	end


  	private
  		def talk_params
    		params.require(:talk).permit(:title, :data)
  		end

end
