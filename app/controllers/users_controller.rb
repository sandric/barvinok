class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by_name(params[:name])
	end

	def likes
		@user = User.find_by_name(params[:name])
	end

	def followers
		@user = User.find_by_name(params[:name])
		@followers = @user.followers
	end

	def following
		@user = User.find_by_name(params[:name])
		@followings = @user.following_users
	end

	def follow
		@user = User.find_by_name(params[:name])
		User.first.follow(@user)

		redirect_to user_path(@user.name)
	end

	def unfollow
		@user = User.find_by_name(params[:name])
		User.first.stop_following(@user)

		redirect_to user_path(@user.name)
	end
end