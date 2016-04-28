require 'rails_helper'


feature 'Users' do
	#background do
    	# add setup details
	#end

	scenario 'Unregistered user opens root page', js: true do
		# write the example!

		visit root_path

		within 'h1' do
			expect(page).to have_content 'Barvinok home'
		end
	end
end