class CommentsController < ApplicationController
	include CommentHelper

	before_filter :get_parent
	before_filter :get_comment, :except => [:create]


	def create
		@comment = Comment.new(comment_params)

		@comment.talk = @talk
		@comment.user = @user

		if @comment.save
			redirect_to [@user, @keyboard, @talk]
		else
			render 'new'
		end
	end

	def update
		if @comment.update(comment_params)
		    redirect_to [@user, @keyboard, @talk, @comment]
		else
		    render 'edit'
		end
  	end

  	def destroy
    	@comment.destroy

    	redirect_to [@user, @keyboard, @talk]
  	end


  	private
		def get_parent
			@user = User.friendly.find(params[:user_id])
			@keyboard = @user.keyboards.friendly.find(params[:keyboard_id])
			@talk = @keyboard.talks.find(params[:talk_id])
  		end

		def get_comment
			@comment = @talk.comments.find(params[:id])
  		end

  		def comment_params
    		params.require(:comment).permit(:data)
  		end

end
