FactoryGirl.define do
	factory :layer do
		name { Faker::Name.first_name }
		color "#fff000"
	end
end