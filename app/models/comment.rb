class Comment < ActiveRecord::Base
	include PublicActivity::Model
  	tracked owner: :user
	
	belongs_to :talk
	belongs_to :user
end