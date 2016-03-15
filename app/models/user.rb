class User < ActiveRecord::Base
	has_many :keyboards
	has_many :talks, :dependent => :destroy
	has_many :comments
end