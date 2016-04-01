class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	include PublicActivity::Common
	
	acts_as_voter

	acts_as_followable
	acts_as_follower
	
	has_many :keyboards, dependent: :destroy
	has_many :talks, :dependent => :destroy
	has_many :comments, dependent: :destroy
end