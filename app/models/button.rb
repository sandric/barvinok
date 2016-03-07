class Button < ActiveRecord::Base
	belongs_to :layer

	def serializable_hash(options={})
		super(
			:only => [:row, :column, :value]
  		)
	end
end