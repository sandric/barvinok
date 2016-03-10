class Keyboard < ActiveRecord::Base
	belongs_to :user
	has_many :commits, :dependent => :destroy
end