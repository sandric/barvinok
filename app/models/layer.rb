class Layer < ActiveRecord::Base
	belongs_to :keyboard
	has_many :buttons

	def serializable_hash(options={})
		super(
			:only => [:name, :id],
	        :include => {
	        	:buttons => {}
	        }
  		)
	end
end