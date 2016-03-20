class CommitsController < ApplicationController

	def index
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:keyboard_name])
		
		@commits = @keyboard.commits
	end

	def show
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:keyboard_name])

		@commit = @keyboard.commits.find(params[:id])
	end

	def create

		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])

		@commit = Commit.new(commit_params)

		@commit.keyboard = @keyboard
		

		if @commit.save
			redirect_to user_keyboard_commit_path(@user.name, @keyboard.name, @commit)
		else
			head :no_content, :status => :bad_request
		end
	end

	def fork

		forked_keyboard = Keyboard.find_by_name(params[:keyboard_name])
		forked_commit = Commit.find(params[:id])


		@keyboard = Keyboard.new

		@keyboard.name = forked_keyboard.name + "'s fork"

		@keyboard.user = User.first

		initial_commit = Commit.create(name: "Initial commit forked from " + forked_commit.name, layers: forked_commit.layers, keyboard: @keyboard)

		initial_commit.parent = forked_commit

		@keyboard.commits << initial_commit

		if @keyboard.save
			redirect_to user_keyboard_path(@keyboard.user.name, @keyboard.name)
		else
			render 'new'
		end
	end

	def diff

		@keyboard = Keyboard.find_by_name(params[:keyboard_name])
		@commit = Commit.find(params[:id])

		p "nana"
		p @commit.as_json
		p "nono"
		p @commit.parent.as_json
		p "nini"







		@parent_commit = @commit.parent
	end



	private 
		def commit_params
    		params.require(:commit).permit(:name, :description, :parent_id, :layers_attributes => [:id, :vid, :name, :color, :layout])
  		end
end