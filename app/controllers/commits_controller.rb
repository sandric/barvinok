class CommitsController < ApplicationController

	def index
		p params
		keyboard = Keyboard.find(params[:keyboard_id])
		@commits = keyboard.commits
	end

	def show
		keyboard = Keyboard.find(params[:keyboard_id])
		@commit = keyboard.commits.find(params[:id])
	end
end