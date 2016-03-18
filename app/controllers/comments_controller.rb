class CommentsController < ApplicationController

	def new
		@talk = Talk.find(params[:talk_id])
		@comment = Comment.new(talk: @talk)
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def create
		@talk = Talk.find(params[:talk_id])
		@comment = Comment.new(comment_params)

		@comment.talk = @talk
		@comment.user = User.first

		if @comment.save
			redirect_to comment_path(@comment)
		else
			render 'new'
		end
	end


	def update
		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
		    redirect_to comment_path(@comment)
		else
		    render 'edit'
		end
  	end


  	def destroy
    	@comment = Comment.find(params[:id])
    	talk = @comment.talk

    	@comment.destroy

    	redirect_to talk_path(talk)
  	end


  	private

  		def comment_params
    		params.require(:comment).permit(:data)
  		end

end
