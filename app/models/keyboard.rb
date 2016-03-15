class Keyboard < ActiveRecord::Base
	belongs_to :user
	has_many :commits, :dependent => :destroy
	has_many :talks, :dependent => :destroy
end