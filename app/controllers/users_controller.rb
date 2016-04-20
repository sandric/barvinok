class UsersController < ApplicationController

	before_filter :get_user, :except => [:index]


	def index
		@users = User.all
	end

	def show
	end

	def activity
	end

	def feed
	end

	def likes
		@liked_keyboards = @user.find_liked_items
	end

	def followers
		@followers = @user.followers
	end

	def following
		@followings = @user.following_users
	end

	def follow
		User.first.follow(@user)

		@user.create_activity :follow, owner: User.first

		redirect_to [@user]
	end

	def unfollow
		User.first.stop_following(@user)

		@user.create_activity :unfollow, owner: User.first

		redirect_to [@user]
	end


	private

	def get_user
		@user = User.friendly.find(params[:id])
	end

	def user_params
  		params.require(:user).permit(:avatar, :name)
	end
end