class KeyboardsController < ApplicationController

	protect_from_forgery with: :exception, :except => [:like, :unlike, :follow, :unfollow]

	before_filter :get_user
	before_filter :get_keyboard, :except => [:index, :new, :create]


	def index
		@keyboards = @user.keyboards
	end

	def new
	end

	def show
	end

	def edit
	end

	def create
		@keyboard = Keyboard.new(keyboard_params)

		@keyboard.user = User.first

		@keyboard.commits << Commit.create(name: "Initial commit", layers: [], keyboard: @keyboard)

		if @keyboard.save
			redirect_to [@keyboard.user, @keyboard]
		else
			render 'new'
		end
	end

	def update
		if @keyboard.update(keyboard_params)
		    redirect_to [@user, @keyboard]
		else
		    render 'edit'
		end
  	end

  	def destroy
    	@keyboard.destroy

    	redirect_to [:keyboards, @user]
  	end


	def likes
		@likers = @keyboard.votes_for.up.by_type(User).voters
	end

	def followers
		@followers = @keyboard.followers
	end

  	def like
		@keyboard.liked_by User.first
		@keyboard.create_activity :like, owner: User.first

		render json: {status: 200, likes: @keyboard.get_likes.size}
	end

  	def unlike
		@keyboard.unliked_by User.first
		@keyboard.create_activity :unlike, owner: User.first

		render json: {status: 200, likes: @keyboard.get_likes.size}
	end

	def follow
		User.first.follow(@keyboard)
		@keyboard.create_activity :follow, owner: User.first

		render json: {status: 200, followers: @keyboard.count_user_followers}
	end

	def unfollow
		User.first.stop_following(@keyboard)
		@keyboard.create_activity :unfollow, owner: User.first

		render json: {status: 200, followers: @keyboard.count_user_followers}
	end

  def layout
    respond_to do |format|
      format.json { render json: @keyboard.commits.last.as_json }
    end
  end

  	private

  		def get_user
			@user = User.friendly.find(params[:user_id])
  		end

	  	def get_keyboard
    		@keyboard = @user.keyboards.friendly.find(params[:id])
  		end

  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
