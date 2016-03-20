# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qwerty_layout = "[
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
	]"


user = User.create(name: "TestUser", email: "testuser@mail.com")
user_second = User.create(name: "TestUser 2", email: "testuser2@mail.com")


first_keyboard = Keyboard.create(name: "First keyboard", description: "First description", user: user)
second_keyboard = Keyboard.create(name: "Second keyboard", description: "Second description", user: user_second)
third_keyboard = Keyboard.create(name: "Thord keyboard", description: "Third description", user: user)


second_keyboard.liked_by user
third_keyboard.liked_by user_second


second_keyboard.liked_by user


5.times do |index|
	commit = Commit.create!(name: "First kb's #{index}'s commit", keyboard: first_keyboard)

	Layer.create!(commit: commit, vid: 1, layout: qwerty_layout, name: "iji First-#{index} commit layer name", color: "#ff0000")
	Layer.create!(commit: commit, vid: 2, layout: qwerty_layout, name: "iji Second-#{index} commit layer name", color: "#00ff00")
end

3.times do |index|
	commit = Commit.create!(name: "Second kb's #{index}'s commit", keyboard: second_keyboard)

	Layer.create!(commit: commit, vid: 1, layout: qwerty_layout, name: "iji First-#{index} commit layer name", color: "#ff0000")
	Layer.create!(commit: commit, vid: 2, layout: qwerty_layout, name: "iji Second-#{index} commit layer name", color: "#00ff00")
end



first_talk = Talk.create(title: "first 1", data: "#OLA **1**", keyboard: first_keyboard, user: user)
second_talk = Talk.create(title: "first 2", data: "#OLA **2**", keyboard: first_keyboard, user: user)
third_talk = Talk.create(title: "first 3", data: "#OLA **3**", keyboard: first_keyboard, user: user_second)

fourth_talk = Talk.create(title: "second 4", data: "#OLA **4**", keyboard: second_keyboard, user: user_second)
fifth_talk = Talk.create(title: "second 5", data: "#OLA **5**", keyboard: second_keyboard, user: user)


first_talk_comment_first = Comment.create(data: "First talk first", talk: first_talk, user: user_second)
first_talk_comment_first = Comment.create(data: "First talk second", talk: first_talk, user: user)
first_talk_comment_first = Comment.create(data: "First talk third", talk: first_talk, user: user_second)

second_talk_comment_first = Comment.create(data: "second talk first", talk: second_talk, user: user_second)
second_talk_comment_first = Comment.create(data: "second talk second", talk: second_talk, user: user)
second_talk_comment_first = Comment.create(data: "second talk third", talk: second_talk, user: user_second)

third_talk_comment_first = Comment.create(data: "third talk first", talk: third_talk, user: user_second)
third_talk_comment_first = Comment.create(data: "third talk second", talk: third_talk, user: user)
third_talk_comment_first = Comment.create(data: "third talk third", talk: third_talk, user: user_second)

fourth_talk_comment_first = Comment.create(data: "fourth talk first", talk: fourth_talk, user: user_second)
fourth_talk_comment_first = Comment.create(data: "fourth talk second", talk: fourth_talk, user: user)
fourth_talk_comment_first = Comment.create(data: "fourth talk third", talk: fourth_talk, user: user_second)

fifth_talk_comment_first = Comment.create(data: "fifth talk first", talk: fifth_talk, user: user_second)
fifth_talk_comment_first = Comment.create(data: "fifth talk second", talk: fifth_talk, user: user)
fifth_talk_comment_first = Comment.create(data: "fifth talk third", talk: fifth_talk, user: user_second)