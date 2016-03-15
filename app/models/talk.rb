class Talk < ActiveRecord::Base
	belongs_to :keyboard
	belongs_to :user
end