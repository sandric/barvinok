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
		@keyboard = Keyboard.find_by_name(params[:keyboard_name])
		@commit = @keyboard.commits.find(params[:id])

		p params
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
end