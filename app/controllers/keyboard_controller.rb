class KeyboardController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:update]

	def show

		@keyboard = Keyboard.first
		
		#render plain: "{\"layers\":[{\"name\":\"Layer 1\",\"id\":1,\"buttons\":[{\"row\":2,\"column\":10,\"value\":\"L\"},{\"row\":1,\"column\":10,\"value\":\"O\"},{\"row\":1,\"column\":12,\"value\":\"CTRL\"},{\"row\":1,\"column\":11,\"value\":\"P\"},{\"row\":2,\"column\":8,\"value\":\"J\"},{\"row\":2,\"column\":5,\"value\":\"F\"},{\"row\":3,\"column\":8,\"value\":\"M\"},{\"row\":2,\"column\":12,\"value\":\"ALT\"},{\"row\":2,\"column\":3,\"value\":\"S\"},{\"row\":2,\"column\":4,\"value\":\"D\"},{\"row\":4,\"column\":5,\"value\":\"BKSP\"},{\"row\":4,\"column\":8,\"value\":\"TAB\"},{\"row\":1,\"column\":5,\"value\":\"R\"},{\"row\":1,\"column\":3,\"value\":\"W\"},{\"row\":3,\"column\":11,\"value\":\"M\"},{\"row\":4,\"column\":6,\"value\":\"SPC\"},{\"row\":2,\"column\":7,\"value\":\"H\"},{\"row\":2,\"column\":9,\"value\":\"K\"},{\"row\":1,\"column\":8,\"value\":\"U\"},{\"row\":1,\"column\":1,\"value\":\"CTRL\"},{\"row\":2,\"column\":11,\"value\":\"L\"},{\"row\":4,\"column\":7,\"value\":\"ENTR\"},{\"row\":2,\"column\":6,\"value\":\"G\"},{\"row\":1,\"column\":4,\"value\":\"E\"},{\"row\":1,\"column\":7,\"value\":\"Y\"},{\"row\":3,\"column\":7,\"value\":\"N\"},{\"row\":3,\"column\":4,\"value\":\"C\"},{\"row\":3,\"column\":9,\"value\":\"M\"},{\"row\":3,\"column\":5,\"value\":\"V\"},{\"row\":3,\"column\":2,\"value\":\"Z\"},{\"row\":2,\"column\":2,\"value\":\"A\"},{\"row\":2,\"column\":1,\"value\":\"ALT\"},{\"row\":1,\"column\":9,\"value\":\"I\"},{\"row\":3,\"column\":6,\"value\":\"B\"},{\"row\":1,\"column\":6,\"value\":\"T\"},{\"row\":3,\"column\":10,\"value\":\"M\"},{\"row\":1,\"column\":2,\"value\":\"Q\"},{\"row\":3,\"column\":3,\"value\":\"X\"}]},{\"name\":\"Layer 2\",\"id\":2,\"buttons\":[{\"row\":3,\"column\":3,\"value\":\"X\"},{\"row\":3,\"column\":10,\"value\":\"M\"},{\"row\":4,\"column\":6,\"value\":\"SPC\"},{\"row\":2,\"column\":5,\"value\":\"F\"},{\"row\":1,\"column\":6,\"value\":\"T\"},{\"row\":3,\"column\":7,\"value\":\"N\"},{\"row\":1,\"column\":12,\"value\":\"CTRL\"},{\"row\":3,\"column\":4,\"value\":\"C\"},{\"row\":1,\"column\":2,\"value\":\"Q\"},{\"row\":1,\"column\":1,\"value\":\"CTRL\"},{\"row\":1,\"column\":3,\"value\":\"W\"},{\"row\":4,\"column\":5,\"value\":\"BKSP\"},{\"row\":3,\"column\":2,\"value\":\"Z\"},{\"row\":2,\"column\":12,\"value\":\"ALT\"},{\"row\":2,\"column\":4,\"value\":\"D\"},{\"row\":1,\"column\":10,\"value\":\"O\"},{\"row\":3,\"column\":9,\"value\":\"M\"},{\"row\":2,\"column\":6,\"value\":\"G\"},{\"row\":2,\"column\":3,\"value\":\"S\"},{\"row\":1,\"column\":4,\"value\":\"E\"},{\"row\":2,\"column\":1,\"value\":\"ALT\"},{\"row\":2,\"column\":11,\"value\":\"L\"},{\"row\":1,\"column\":8,\"value\":\"U\"},{\"row\":1,\"column\":9,\"value\":\"I\"},{\"row\":2,\"column\":2,\"value\":\"A\"},{\"row\":2,\"column\":7,\"value\":\"H\"},{\"row\":2,\"column\":10,\"value\":\"L\"},{\"row\":3,\"column\":6,\"value\":\"B\"},{\"row\":4,\"column\":7,\"value\":\"ENTR\"},{\"row\":2,\"column\":8,\"value\":\"J\"},{\"row\":3,\"column\":8,\"value\":\"M\"},{\"row\":4,\"column\":8,\"value\":\"TAB\"},{\"row\":1,\"column\":11,\"value\":\"P\"},{\"row\":1,\"column\":5,\"value\":\"R\"},{\"row\":2,\"column\":9,\"value\":\"K\"},{\"row\":1,\"column\":7,\"value\":\"Y\"},{\"row\":3,\"column\":5,\"value\":\"V\"},{\"row\":3,\"column\":11,\"value\":\"M\"}]}]}"
	end

	def update
		render plain: "updated"
	end


	def keyboardObject
	
		keyboard = Keyboard.first

	end

end
