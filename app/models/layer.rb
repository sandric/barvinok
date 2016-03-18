class Layer < ActiveRecord::Base

	belongs_to :commit

	def as_json
		{
			id: self.vid,
			name: self.name,
			color: self.color,
			buttons: JSON.parse(self.layout)
		}.to_json
	end
end