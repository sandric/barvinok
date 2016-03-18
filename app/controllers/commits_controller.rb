class CommitsController < ApplicationController

	def index
		@keyboard = Keyboard.find(params[:keyboard_id])
		@commits = @keyboard.commits
	end

	def show
		@commit = Commit.find(params[:id])
		@keyboard = @commit.keyboard
	end

	def create
		@keyboard = Keyboard.find(params[:keyboard_id])
		@commit = @keyboard.commits.find(params[:id])

		p params
	end

	def fork
		forked_commit = Commit.find(params[:id])

		forked_keyboard = forked_commit.keyboard


		@keyboard = Keyboard.new

		@keyboard.name = forked_keyboard.name + "'s fork"

		@keyboard.user = User.first

		initial_commit = Commit.create(name: "Initial commit forked from " + forked_commit.name, layers: forked_commit.layers, keyboard: @keyboard)

		initial_commit.parent = forked_commit

		@keyboard.commits << initial_commit

		if @keyboard.save
			redirect_to @keyboard
		else
			render 'new'
		end
	end
end