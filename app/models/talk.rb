class Talk < ActiveRecord::Base
	belongs_to :keyboard
	belongs_to :user
	has_many :comments
end