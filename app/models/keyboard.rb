class Keyboard < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :user
	has_many :commits, :dependent => :destroy
	has_many :talks, :dependent => :destroy
end