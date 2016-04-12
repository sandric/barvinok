class CommentsController < ApplicationController
	include CommentHelper


	def create
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])
		@talk = Talk.find(params[:talk_id])

		@comment = Comment.new(comment_params)

		@comment.talk = @talk
		@comment.user = @user

		if @comment.save
			redirect_to show_comment_path(@user.name, @keyboard.name, @talk, @comment)
		else
			render 'new'
		end
	end

	def update
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])
		@talk = Talk.find(params[:talk_id])

		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
		    redirect_to show_comment_path(@user.name, @keyboard.name, @talk, @comment)
		else
		    render 'edit'
		end
  	end

  	def destroy
  		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])
		@talk = Talk.find(params[:talk_id])

    	@comment = Comment.find(params[:id])

    	@comment.destroy

    	redirect_to user_keyboard_talk_path(@user.name, @keyboard.name, @talk)
  	end


  	private

  		def comment_params
    		params.require(:comment).permit(:data)
  		end

end
