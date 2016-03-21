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



	def self.seed_layers_autosuggestions
    	
    	$redis.flushall

    	Layer.all.each do |layer|  	
	      	path = Rails.application.routes.url_helpers
	      		.user_keyboard_commit_layer_path(
	      			layer.commit.keyboard.user.name, 
	      			layer.commit.keyboard.name, 
	      			layer.commit, 
	      			layer.name)
	      	
	      	1.upto(path.length - 1) do |n|
	      		prefix = path[1, n]
	   	    	$redis.zadd "search-suggestions:#{prefix.downcase}", 1, path.downcase
	      	end
    	end
  	end

	def self.layers_path_from_suggestion(query)
		$redis.zrevrange "search-suggestions:#{query.downcase}", 0, 9
	end
end