class KeyboardsController < ApplicationController

	def index
		@user = User.find_by_name(params[:user_name])
		@keyboards = @user.keyboards
	end

	def new
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.new
	end

	def show
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])
	end

	def edit
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])
	end

	def likes
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])

		@likers = @keyboard.votes_for.up.by_type(User).voters
	end

	def followers
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])

		@followers = @keyboard.followers
	end

	def create
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.new(keyboard_params)

		@keyboard.user = User.first

		@keyboard.commits << Commit.create(name: "Initial commit", layers: [], keyboard: @keyboard)

		if @keyboard.save
			redirect_to user_keyboard_path(@user.name, @keyboard.name)
		else
			render 'new'
		end
	end

	def update
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:name])

		if @keyboard.update(keyboard_params)
		    redirect_to user_keyboard_path(@user.name, @keyboard.name)
		else
		    render 'edit'
		end
  	end

  	def like
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])

		@keyboard.liked_by User.first

		@keyboard.create_activity :like, owner: User.first

		redirect_to user_keyboard_path(@user.name, @keyboard.name)
	end

  	def unlike
		@user = User.find_by_name(params[:user_name])
		@keyboard = @user.keyboards.find_by_name(params[:name])

		@keyboard.unliked_by User.first

		@keyboard.create_activity :unlike, owner: User.first

		redirect_to user_keyboard_path(@user.name, @keyboard.name)
	end

  	def destroy
  		@user = User.find_by_name(params[:user_name])
    	@keyboard = Keyboard.find_by_name(params[:name])

    	@keyboard.destroy

    	redirect_to user_keyboards_path(@user.name)
  	end



	def follow
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:name])

		User.first.follow(@keyboard)

		@keyboard.create_activity :follow, owner: User.first

		redirect_to user_keyboard_path(@user.name, @keyboard.name)
	end

	def unfollow
		@user = User.find_by_name(params[:user_name])
		@keyboard = Keyboard.find_by_name(params[:name])

		User.first.stop_following(@keyboard)

		@keyboard.create_activity :unfollow, owner: User.first

		redirect_to user_keyboard_path(@user.name, @keyboard.name)
	end


  	private
  		def keyboard_params
    		params.require(:keyboard).permit(:name, :description)
  		end

end
