class Talk < ActiveRecord::Base
	include PublicActivity::Model
  	tracked owner: :user
  	
	belongs_to :keyboard
	belongs_to :user
	has_many :comments
end