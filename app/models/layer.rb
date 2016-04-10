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



	def self.layers_path_from_suggestion(query)
		$redis.zrevrange "search-suggestions:#{query.downcase}", 0, 9
	end



	def self.seed_layer_autosuggestion(path)

		1.upto(path.length - 1) do |n|
      		prefix = path[1, n]
   	    	$redis.zadd "search-suggestions:#{prefix.downcase}", 1, path.downcase
      	end
	end

	def self.seed_base_layers_autosuggestions

		[
			"/base/empty",
			"/base/qwerty",
			"/base/dvorak",
			"/base/colemak"
		].each do |path|
	      	self.seed_layer_autosuggestion(path)
    	end
	end

	def self.seed_users_layers_autosuggestions
    	
    	Layer.all.each do |layer|  	
	      	path = Rails.application.routes.url_helpers
	      		.user_keyboard_commit_layer_path(
	      			layer.commit.keyboard.user.name, 
	      			layer.commit.keyboard.name, 
	      			layer.commit, 
	      			layer.name)
	      	
	      	self.seed_layer_autosuggestion(path)
    	end
  	end

  	def self.seed_layers_autosuggestions

  		$redis.flushall

  		self.seed_base_layers_autosuggestions
  		self.seed_users_layers_autosuggestions
  	end


	def self.empty_layer
		"{
			\"vid\":1,
			\"name\":\"Empty layer\",
			\"color\":\"#ffffff\",
			\"layout\":[
				{\"row\":1,\"column\":1,\"value\":\"\"},
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
				{\"row\":4,\"column\":7,\"value\":\"\"}
			]
		}"
	end

	def self.qwerty_layer
		"{
			\"vid\":1,
			\"name\":\"Qwerty layer\",
			\"color\":\"#ffffff\",
			\"layout\":[
				{\"row\":1,\"column\":1,\"value\":\"CTRL\"},
				{\"row\":1,\"column\":2,\"value\":\"Q\"},
				{\"row\":1,\"column\":3,\"value\":\"W\"},
				{\"row\":1,\"column\":4,\"value\":\"E\"},
				{\"row\":1,\"column\":5,\"value\":\"R\"},
				{\"row\":1,\"column\":6,\"value\":\"T\"},		
				{\"row\":1,\"column\":7,\"value\":\"Y\"},
				{\"row\":1,\"column\":8,\"value\":\"U\"},
				{\"row\":1,\"column\":9,\"value\":\"I\"},
				{\"row\":1,\"column\":10,\"value\":\"O\"},
				{\"row\":1,\"column\":11,\"value\":\"P\"},
				{\"row\":1,\"column\":12,\"value\":\"CTRL\"},
				{\"row\":2,\"column\":1,\"value\":\"ALT\"},
				{\"row\":2,\"column\":2,\"value\":\"A\"},
				{\"row\":2,\"column\":3,\"value\":\"S\"},
				{\"row\":2,\"column\":4,\"value\":\"D\"},
				{\"row\":2,\"column\":5,\"value\":\"F\"},
				{\"row\":2,\"column\":6,\"value\":\"G\"},
				{\"row\":2,\"column\":7,\"value\":\"H\"},
				{\"row\":2,\"column\":8,\"value\":\"J\"},
				{\"row\":2,\"column\":9,\"value\":\"K\"},
				{\"row\":2,\"column\":10,\"value\":\"L\"},
				{\"row\":2,\"column\":11,\"value\":\"L\"},
				{\"row\":2,\"column\":12,\"value\":\"ALT\"},
				{\"row\":3,\"column\":2,\"value\":\"Z\"},
				{\"row\":3,\"column\":3,\"value\":\"X\"},
				{\"row\":3,\"column\":4,\"value\":\"C\"},
				{\"row\":3,\"column\":5,\"value\":\"V\"},
				{\"row\":3,\"column\":6,\"value\":\"B\"},
				{\"row\":3,\"column\":7,\"value\":\"N\"},
				{\"row\":3,\"column\":8,\"value\":\"M\"},
				{\"row\":3,\"column\":9,\"value\":\"M\"},
				{\"row\":3,\"column\":10,\"value\":\"M\"},
				{\"row\":3,\"column\":11,\"value\":\"M\"},
				{\"row\":4,\"column\":5,\"value\":\"BKSP\"},
				{\"row\":4,\"column\":6,\"value\":\"SPC\"},
				{\"row\":4,\"column\":8,\"value\":\"TAB\"},
				{\"row\":4,\"column\":7,\"value\":\"ENTR\"}
			]
		}"
	end

	def self.dvorak_layer
		"{
			\"vid\":1,
			\"name\":\"Dvorak layer\",
			\"color\":\"#ffffff\",
			\"layout\":[
				{\"row\":1,\"column\":1,\"value\":\"CTRL\"},
				{\"row\":1,\"column\":2,\"value\":\"Q\"},
				{\"row\":1,\"column\":3,\"value\":\"W\"},
				{\"row\":1,\"column\":4,\"value\":\"E\"},
				{\"row\":1,\"column\":5,\"value\":\"R\"},
				{\"row\":1,\"column\":6,\"value\":\"T\"},		
				{\"row\":1,\"column\":7,\"value\":\"Y\"},
				{\"row\":1,\"column\":8,\"value\":\"U\"},
				{\"row\":1,\"column\":9,\"value\":\"I\"},
				{\"row\":1,\"column\":10,\"value\":\"O\"},
				{\"row\":1,\"column\":11,\"value\":\"P\"},
				{\"row\":1,\"column\":12,\"value\":\"CTRL\"},
				{\"row\":2,\"column\":1,\"value\":\"ALT\"},
				{\"row\":2,\"column\":2,\"value\":\"A\"},
				{\"row\":2,\"column\":3,\"value\":\"S\"},
				{\"row\":2,\"column\":4,\"value\":\"D\"},
				{\"row\":2,\"column\":5,\"value\":\"F\"},
				{\"row\":2,\"column\":6,\"value\":\"G\"},
				{\"row\":2,\"column\":7,\"value\":\"H\"},
				{\"row\":2,\"column\":8,\"value\":\"J\"},
				{\"row\":2,\"column\":9,\"value\":\"K\"},
				{\"row\":2,\"column\":10,\"value\":\"L\"},
				{\"row\":2,\"column\":11,\"value\":\"L\"},
				{\"row\":2,\"column\":12,\"value\":\"ALT\"},
				{\"row\":3,\"column\":2,\"value\":\"Z\"},
				{\"row\":3,\"column\":3,\"value\":\"X\"},
				{\"row\":3,\"column\":4,\"value\":\"C\"},
				{\"row\":3,\"column\":5,\"value\":\"V\"},
				{\"row\":3,\"column\":6,\"value\":\"B\"},
				{\"row\":3,\"column\":7,\"value\":\"N\"},
				{\"row\":3,\"column\":8,\"value\":\"M\"},
				{\"row\":3,\"column\":9,\"value\":\"M\"},
				{\"row\":3,\"column\":10,\"value\":\"M\"},
				{\"row\":3,\"column\":11,\"value\":\"M\"},
				{\"row\":4,\"column\":5,\"value\":\"BKSP\"},
				{\"row\":4,\"column\":6,\"value\":\"SPC\"},
				{\"row\":4,\"column\":8,\"value\":\"TAB\"},
				{\"row\":4,\"column\":7,\"value\":\"ENTR\"}
			]
		}"
	end

	def self.colemak_layer
		"{
			\"vid\":1,
			\"name\":\"Colemak layer\",
			\"color\":\"#ffffff\",
			\"layout\":[
				{\"row\":1,\"column\":1,\"value\":\"CTRL\"},
				{\"row\":1,\"column\":2,\"value\":\"Q\"},
				{\"row\":1,\"column\":3,\"value\":\"W\"},
				{\"row\":1,\"column\":4,\"value\":\"E\"},
				{\"row\":1,\"column\":5,\"value\":\"R\"},
				{\"row\":1,\"column\":6,\"value\":\"T\"},		
				{\"row\":1,\"column\":7,\"value\":\"Y\"},
				{\"row\":1,\"column\":8,\"value\":\"U\"},
				{\"row\":1,\"column\":9,\"value\":\"I\"},
				{\"row\":1,\"column\":10,\"value\":\"O\"},
				{\"row\":1,\"column\":11,\"value\":\"P\"},
				{\"row\":1,\"column\":12,\"value\":\"CTRL\"},
				{\"row\":2,\"column\":1,\"value\":\"ALT\"},
				{\"row\":2,\"column\":2,\"value\":\"A\"},
				{\"row\":2,\"column\":3,\"value\":\"S\"},
				{\"row\":2,\"column\":4,\"value\":\"D\"},
				{\"row\":2,\"column\":5,\"value\":\"F\"},
				{\"row\":2,\"column\":6,\"value\":\"G\"},
				{\"row\":2,\"column\":7,\"value\":\"H\"},
				{\"row\":2,\"column\":8,\"value\":\"J\"},
				{\"row\":2,\"column\":9,\"value\":\"K\"},
				{\"row\":2,\"column\":10,\"value\":\"L\"},
				{\"row\":2,\"column\":11,\"value\":\"L\"},
				{\"row\":2,\"column\":12,\"value\":\"ALT\"},
				{\"row\":3,\"column\":2,\"value\":\"Z\"},
				{\"row\":3,\"column\":3,\"value\":\"X\"},
				{\"row\":3,\"column\":4,\"value\":\"C\"},
				{\"row\":3,\"column\":5,\"value\":\"V\"},
				{\"row\":3,\"column\":6,\"value\":\"B\"},
				{\"row\":3,\"column\":7,\"value\":\"N\"},
				{\"row\":3,\"column\":8,\"value\":\"M\"},
				{\"row\":3,\"column\":9,\"value\":\"M\"},
				{\"row\":3,\"column\":10,\"value\":\"M\"},
				{\"row\":3,\"column\":11,\"value\":\"M\"},
				{\"row\":4,\"column\":5,\"value\":\"BKSP\"},
				{\"row\":4,\"column\":6,\"value\":\"SPC\"},
				{\"row\":4,\"column\":8,\"value\":\"TAB\"},
				{\"row\":4,\"column\":7,\"value\":\"ENTR\"}
			]
		}"
	end
end