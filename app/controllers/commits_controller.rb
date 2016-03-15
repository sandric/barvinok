class CommitsController < ApplicationController

	def index
		@keyboard = Keyboard.find(params[:keyboard_id])
		@commits = @keyboard.commits
	end

	def show
		@keyboard = Keyboard.find(params[:keyboard_id])
		@commit = @keyboard.commits.find(params[:id])
	end

	def fork
		forked_keyboard = Keyboard.find(params[:keyboard_id])
		forked_commit = forked_keyboard.commits.find(params[:id])

		@keyboard = Keyboard.new

		@keyboard.name = forked_keyboard.name + "'s fork"

		@keyboard.user = User.first

		initial_commit = Commit.create(name: "Initial commit forked from " + forked_commit.name, data: forked_commit.data, keyboard: @keyboard)

		initial_commit.parent = forked_commit

		@keyboard.commits << initial_commit

		if @keyboard.save
			redirect_to @keyboard
		else
			render 'new'
		end
	end
end