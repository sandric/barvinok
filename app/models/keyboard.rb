class Keyboard < ActiveRecord::Base
	belongs_to :user
	has_many :layers


	def serializable_hash(options={})
		super(
			:only => [:name],
	        :include => {
	        	:layers => {},
	        }
  		)
	end
end