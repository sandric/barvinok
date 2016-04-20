class CommitsController < ApplicationController

	before_filter :get_user_and_keyboard
	before_filter :get_commit, :except => [:index, :new, :create]

	def index
		@commits = @keyboard.commits
	end

	def show
	end

	def new
		@commit = Commit.new(@keyboard.commits.last.attributes)
		@commit.name = "New commit name"
		@commit.description = "New commit description"
	end


	def create
		attributes = commit_params

		layers = JSON.parse(attributes[:layers])

		attributes[:layers_attributes] = layers["layers"].map do |layer|
			layer["vid"] = layer.delete("id")
			layer["layout"] = JSON.generate(layer["layout"])
			layer
		end

		attributes.delete(:layers)

		@commit = Commit.new(attributes)

		@commit.keyboard = @keyboard

		if @commit.save
			redirect_to [@user, @keyboard, @commit]
		else
			render :new
		end
	end

	def fork
		forked_commit = Commit.find(params[:id])

		@forked_keyboard = @keyboard
		@forked_keyboard.name = @keyboard.name + "'s fork"
		@forked_keyboard.user = User.first

		initial_commit = Commit.create(name: "Initial commit forked from " + forked_commit.name,
			layers: forked_commit.layers,
			keyboard: @forked_keyboard)

		initial_commit.parent = forked_commit

		@forked_keyboard.commits << initial_commit

		if @forked_keyboard.save
			redirect_to [User.first, @keyboard]
		else
			render 'new'
		end
	end

	def diff
	end


	private
		def get_user_and_keyboard
			@user = User.friendly.find(params[:user_id])
			@keyboard = @user.keyboards.friendly.find(params[:keyboard_id])
  		end

		def get_commit
			@commit = @keyboard.commits.find(params[:id])
  		end

		def commit_params
    		params.require(:commit).permit(:name, :description, :parent_id, :layers)
  		end
end