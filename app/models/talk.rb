class Talk < ActiveRecord::Base
	include PublicActivity::Model
  	tracked only: [:create, :update], owner: :user
  	
	belongs_to :keyboard
	belongs_to :user
	has_many :comments, dependent: :destroy
end