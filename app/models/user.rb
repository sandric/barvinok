class User < ActiveRecord::Base
	acts_as_voter

	acts_as_followable
	acts_as_follower
	
	has_many :keyboards
	has_many :talks, :dependent => :destroy
	has_many :comments
end