class Keyboard < ActiveRecord::Base
	include PublicActivity::Model
  	tracked only: [:create, :update], owner: :user

	acts_as_votable

	acts_as_followable

	belongs_to :user
	has_many :commits, :dependent => :destroy
	has_many :talks, :dependent => :destroy


	extend FriendlyId
	friendly_id :name, :use => :scoped, :scope => :user

	def should_generate_new_friendly_id?
    	name_changed?
  	end

end