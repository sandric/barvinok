# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "TestUser", email: "testuser@mail.com")

first_keyboard = Keyboard.create(name: "First keyboard", user: user)
second_keyboard = Keyboard.create(name: "Second keyboard", user: user)

first_layer = Layer.create(name: "First layer", keyboard: first_keyboard)
second_layer = Layer.create(name: "Second layer", keyboard: first_keyboard)
third_layer = Layer.create(name: "Third layer", keyboard: first_keyboard)

fourth_layer = Layer.create(name: "Fourth layer", keyboard: second_keyboard)
fifth_layer = Layer.create(name: "Fifth layer", keyboard: second_keyboard)


4.times do |row|
	12.times do |column|
		Button.create(row: row + 1, column: column + 1, value: "#{row + 1}_#{column + 1}", layer: first_layer)
	end
end


4.times do |row|
	12.times do |column|
		Button.create(row: row + 1, column: column + 1, value: "#{row + 1}_#{column + 1}", layer: second_layer)
	end
end


4.times do |row|
	12.times do |column|
		Button.create(row: row + 1, column: column + 1, value: "#{row + 1}_#{column + 1}", layer: third_layer)
	end
end


4.times do |row|
	12.times do |column|
		Button.create(row: row + 1, column: column + 1, value: "#{row}_#{column + 1}", layer: fourth_layer)
	end
end


4.times do |row|
	12.times do |column|
		Button.create(row: row + 1, column: column + 1, value: "#{row + 1}_#{column + 1}", layer: fifth_layer)
	end
end