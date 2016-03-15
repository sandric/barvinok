class Commit < ActiveRecord::Base
	acts_as_tree
	
	belongs_to :keyboard
end