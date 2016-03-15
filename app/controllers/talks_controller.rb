class TalksController < ApplicationController

	def index
		@keyboard = Keyboard.find(params[:keyboard_id])
		p @keyboard.talks
		@talks = @keyboard.talks
	end

	def new
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.new(keyboard: @keyboard)
	end

	def show
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.find(params[:id])
	end

	def edit
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.find(params[:id])
	end

	def create
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.new(talk_params)

		@talk.keyboard = @keyboard
		@talk.user = User.first

		if @talk.save
			redirect_to keyboard_talk_path(@keyboard, @talk)
		else
			render 'new'
		end
	end


	def update
		@keyboard = Keyboard.find(params[:keyboard_id])
		@talk = Talk.find(params[:id])

		if @talk.update(talk_params)
		    redirect_to keyboard_talk_path(@keyboard, @talk)
		else
		    render 'edit'
		end
  	end


  	def destroy
  		@keyboard = Keyboard.find(params[:keyboard_id])
    	@talk = Talk.find(params[:id])
    	@talk.destroy

    	redirect_to keyboard_talks_path(@keyboard)
  	end


  	private
  		def talk_params
    		params.require(:talk).permit(:title, :data)
  		end

end
