class Layer < ActiveRecord::Base

	belongs_to :commit

	def as_json
		{
			vid: self.vid,
			name: self.name,
			color: self.color,
			layout: JSON.parse(self.layout)
		}.to_json
	end


	def self.layer_from_json(layer_json)

		layer = Layer.new

		layer.vid = layer_json["vid"]
		layer.name = layer_json["name"]
		layer.color = layer_json["color"]
		layer.layout = layer_json["layout"].to_s

		return layer
	end

	def self.layer_from_json_string(layer_string)

		layer_json = JSON.parse(layer_string)

		self.layer_from_json(layer_json)
	end

	def self.layers_from_json_string(layers_string)

		layers_json = JSON.parse(layers_string)

		layers_json["layers"].map { |layer_json| self.layer_from_json layer_json } 
	end
end