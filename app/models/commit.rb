class Commit < ActiveRecord::Base
	include PublicActivity::Model
  	tracked only: [:create], owner: proc {|controller, model| model.keyboard.user }
  	
	acts_as_tree
	
	belongs_to :keyboard
	has_many :layers, :inverse_of => :commit, dependent: :destroy

	accepts_nested_attributes_for :layers

	def as_json
       	{
            layers: self.layers.all.map {|layer| JSON.parse layer.as_json}
   	   	}.to_json
    end
end