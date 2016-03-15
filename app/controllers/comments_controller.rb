class CommentsController < ApplicationController

	before_action :resources

	def new
		@comment = Comment.new(talk: @talk)
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)

		@comment.talk = @talk
		@comment.user = User.first

		if @comment.save
			redirect_to keyboard_talk_comment_path(@keyboard, @talk, @comment)
		else
			render 'new'
		end
	end


	def update
		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
		    redirect_to keyboard_talk_comment_path(@keyboard, @talk, @comment)
		else
		    render 'edit'
		end
  	end


  	def destroy
    	@comment = Comment.find(params[:id])
    	@comment.destroy

    	redirect_to keyboard_talk_path(@keyboard, @talk)
  	end


  	private

  		def resources
  			@keyboard = Keyboard.find(params[:keyboard_id])
  			@talk = Talk.find(params[:talk_id])
  		end

  		def comment_params
    		params.require(:comment).permit(:data)
  		end

end
