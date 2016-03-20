class Commit < ActiveRecord::Base
	acts_as_tree
	
	belongs_to :keyboard
	has_many :layers, :inverse_of => :commit

	accepts_nested_attributes_for :layers

	def as_json
       	{
            layers: self.layers.all.map {|layer| JSON.parse layer.as_json}
   	   	}.to_json
    end


	def self.seed_layers_autosuggestions
    	
    	names = [
    		"keyboards/1/commits/1/layers/1"
    	]

    	$redis.flushall

    	names.each do |name|  	
	      	1.upto(name.length - 1) do |n|
	      		prefix = name[0, n]
	    		$redis.zadd "search-suggestions:#{prefix.downcase}", 1, name.downcase
	      	end
    	end
  	end


	def self.layers(query)
		$redis.zrevrange "search-suggestions:#{query.downcase}", 0, 9
	end

	def self.layer(layer_id)
		"{\"name\":\"Layer from server\",\"color\":\"#abcdef\",\"buttons\":[{\"row\":1,\"column\":1,\"value\":\"\"},
		{\"row\":1,\"column\":2,\"value\":\"\"},
		{\"row\":1,\"column\":3,\"value\":\"\"},
		{\"row\":1,\"column\":4,\"value\":\"\"},
		{\"row\":1,\"column\":5,\"value\":\"\"},
		{\"row\":1,\"column\":6,\"value\":\"\"},		
		{\"row\":1,\"column\":7,\"value\":\"\"},
		{\"row\":1,\"column\":8,\"value\":\"\"},
		{\"row\":1,\"column\":9,\"value\":\"\"},
		{\"row\":1,\"column\":10,\"value\":\"\"},
		{\"row\":1,\"column\":11,\"value\":\"\"},
		{\"row\":1,\"column\":12,\"value\":\"\"},
		{\"row\":2,\"column\":1,\"value\":\"\"},
		{\"row\":2,\"column\":2,\"value\":\"\"},
		{\"row\":2,\"column\":3,\"value\":\"\"},
		{\"row\":2,\"column\":4,\"value\":\"\"},
		{\"row\":2,\"column\":5,\"value\":\"\"},
		{\"row\":2,\"column\":6,\"value\":\"\"},
		{\"row\":2,\"column\":7,\"value\":\"\"},
		{\"row\":2,\"column\":8,\"value\":\"\"},
		{\"row\":2,\"column\":9,\"value\":\"\"},
		{\"row\":2,\"column\":10,\"value\":\"\"},
		{\"row\":2,\"column\":11,\"value\":\"\"},
		{\"row\":2,\"column\":12,\"value\":\"\"},
		{\"row\":3,\"column\":2,\"value\":\"\"},
		{\"row\":3,\"column\":3,\"value\":\"\"},
		{\"row\":3,\"column\":4,\"value\":\"\"},
		{\"row\":3,\"column\":5,\"value\":\"\"},
		{\"row\":3,\"column\":6,\"value\":\"\"},
		{\"row\":3,\"column\":7,\"value\":\"\"},
		{\"row\":3,\"column\":8,\"value\":\"\"},
		{\"row\":3,\"column\":9,\"value\":\"\"},
		{\"row\":3,\"column\":10,\"value\":\"\"},
		{\"row\":3,\"column\":11,\"value\":\"\"},
		{\"row\":4,\"column\":5,\"value\":\"\"},
		{\"row\":4,\"column\":6,\"value\":\"\"},
		{\"row\":4,\"column\":8,\"value\":\"\"},
		{\"row\":4,\"column\":7,\"value\":\"\"}]}"
	end
end