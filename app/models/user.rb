class User < ActiveRecord::Base
	acts_as_voter
	
	has_many :keyboards
	has_many :talks, :dependent => :destroy
	has_many :comments
end