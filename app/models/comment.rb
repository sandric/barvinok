class Comment < ActiveRecord::Base
	include PublicActivity::Model
  	tracked only: [:create, :update], owner: :user
	
	belongs_to :talk
	belongs_to :user
end