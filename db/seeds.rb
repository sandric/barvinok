# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "TestUser", email: "testuser@mail.com")
user_second = User.create(name: "TestUser 2", email: "testuser2@mail.com")

first_keyboard = Keyboard.create(name: "First keyboard", description: "First description", user: user)
second_keyboard = Keyboard.create(name: "Second keyboard", description: "Second description", user: user)

keyboard_json_data = "{\"layers\":[{\"name\":\"Layer 1\",\"id\":1,\"buttons\":[{\"row\":2,\"column\":10,\"value\":\"L\"},{\"row\":1,\"column\":10,\"value\":\"O\"},{\"row\":1,\"column\":12,\"value\":\"CTRL\"},{\"row\":1,\"column\":11,\"value\":\"P\"},{\"row\":2,\"column\":8,\"value\":\"J\"},{\"row\":2,\"column\":5,\"value\":\"F\"},{\"row\":3,\"column\":8,\"value\":\"M\"},{\"row\":2,\"column\":12,\"value\":\"ALT\"},{\"row\":2,\"column\":3,\"value\":\"S\"},{\"row\":2,\"column\":4,\"value\":\"D\"},{\"row\":4,\"column\":5,\"value\":\"BKSP\"},{\"row\":4,\"column\":8,\"value\":\"TAB\"},{\"row\":1,\"column\":5,\"value\":\"R\"},{\"row\":1,\"column\":3,\"value\":\"W\"},{\"row\":3,\"column\":11,\"value\":\"M\"},{\"row\":4,\"column\":6,\"value\":\"SPC\"},{\"row\":2,\"column\":7,\"value\":\"H\"},{\"row\":2,\"column\":9,\"value\":\"K\"},{\"row\":1,\"column\":8,\"value\":\"U\"},{\"row\":1,\"column\":1,\"value\":\"CTRL\"},{\"row\":2,\"column\":11,\"value\":\"L\"},{\"row\":4,\"column\":7,\"value\":\"ENTR\"},{\"row\":2,\"column\":6,\"value\":\"G\"},{\"row\":1,\"column\":4,\"value\":\"E\"},{\"row\":1,\"column\":7,\"value\":\"Y\"},{\"row\":3,\"column\":7,\"value\":\"N\"},{\"row\":3,\"column\":4,\"value\":\"C\"},{\"row\":3,\"column\":9,\"value\":\"M\"},{\"row\":3,\"column\":5,\"value\":\"V\"},{\"row\":3,\"column\":2,\"value\":\"Z\"},{\"row\":2,\"column\":2,\"value\":\"A\"},{\"row\":2,\"column\":1,\"value\":\"ALT\"},{\"row\":1,\"column\":9,\"value\":\"I\"},{\"row\":3,\"column\":6,\"value\":\"B\"},{\"row\":1,\"column\":6,\"value\":\"T\"},{\"row\":3,\"column\":10,\"value\":\"M\"},{\"row\":1,\"column\":2,\"value\":\"Q\"},{\"row\":3,\"column\":3,\"value\":\"X\"}]},{\"name\":\"Layer 2\",\"id\":2,\"buttons\":[{\"row\":3,\"column\":3,\"value\":\"X\"},{\"row\":3,\"column\":10,\"value\":\"M\"},{\"row\":4,\"column\":6,\"value\":\"SPC\"},{\"row\":2,\"column\":5,\"value\":\"F\"},{\"row\":1,\"column\":6,\"value\":\"T\"},{\"row\":3,\"column\":7,\"value\":\"N\"},{\"row\":1,\"column\":12,\"value\":\"CTRL\"},{\"row\":3,\"column\":4,\"value\":\"C\"},{\"row\":1,\"column\":2,\"value\":\"Q\"},{\"row\":1,\"column\":1,\"value\":\"CTRL\"},{\"row\":1,\"column\":3,\"value\":\"W\"},{\"row\":4,\"column\":5,\"value\":\"BKSP\"},{\"row\":3,\"column\":2,\"value\":\"Z\"},{\"row\":2,\"column\":12,\"value\":\"ALT\"},{\"row\":2,\"column\":4,\"value\":\"D\"},{\"row\":1,\"column\":10,\"value\":\"O\"},{\"row\":3,\"column\":9,\"value\":\"M\"},{\"row\":2,\"column\":6,\"value\":\"G\"},{\"row\":2,\"column\":3,\"value\":\"S\"},{\"row\":1,\"column\":4,\"value\":\"E\"},{\"row\":2,\"column\":1,\"value\":\"ALT\"},{\"row\":2,\"column\":11,\"value\":\"L\"},{\"row\":1,\"column\":8,\"value\":\"U\"},{\"row\":1,\"column\":9,\"value\":\"I\"},{\"row\":2,\"column\":2,\"value\":\"A\"},{\"row\":2,\"column\":7,\"value\":\"H\"},{\"row\":2,\"column\":10,\"value\":\"L\"},{\"row\":3,\"column\":6,\"value\":\"B\"},{\"row\":4,\"column\":7,\"value\":\"ENTR\"},{\"row\":2,\"column\":8,\"value\":\"J\"},{\"row\":3,\"column\":8,\"value\":\"M\"},{\"row\":4,\"column\":8,\"value\":\"TAB\"},{\"row\":1,\"column\":11,\"value\":\"P\"},{\"row\":1,\"column\":5,\"value\":\"R\"},{\"row\":2,\"column\":9,\"value\":\"K\"},{\"row\":1,\"column\":7,\"value\":\"Y\"},{\"row\":3,\"column\":5,\"value\":\"V\"},{\"row\":3,\"column\":11,\"value\":\"M\"}]}]}"

first_first_commit = Commit.create(name: "First first commit", keyboard: first_keyboard, data: keyboard_json_data)
first_second_commit = Commit.create(name: "First second commit", keyboard: first_keyboard, data: keyboard_json_data)
first_third_commit = Commit.create(name: "First third commit", keyboard: first_keyboard, data: keyboard_json_data)
first_fourth_commit = Commit.create(name: "First fourth commit", keyboard: first_keyboard, data: keyboard_json_data)
first_fifth_commit = Commit.create(name: "First fifth commit", keyboard: first_keyboard, data: keyboard_json_data)

second_first_commit = Commit.create(name: "Second first commit", keyboard: second_keyboard, data: keyboard_json_data)
second_second_commit = Commit.create(name: "Second second commit", keyboard: second_keyboard, data: keyboard_json_data)
second_third_commit = Commit.create(name: "Second third commit", keyboard: second_keyboard, data: keyboard_json_data)

first_talk = Talk.create(title: "first 1", data: "#OLA **1**", keyboard: first_keyboard, user: user)
second_talk = Talk.create(title: "first 2", data: "#OLA **2**", keyboard: first_keyboard, user: user)
third_talk = Talk.create(title: "first 3", data: "#OLA **3**", keyboard: first_keyboard, user: user_second)

fourth_talk = Talk.create(title: "second 4", data: "#OLA **4**", keyboard: second_keyboard, user: user_second)
fifth_talk = Talk.create(title: "second 5", data: "#OLA **5**", keyboard: second_keyboard, user: user)
