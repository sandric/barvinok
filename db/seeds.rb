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


user = User.create!(name: "testuser", email: "testuser@mail.com", password: 'password', password_confirmation: 'password')
user_second = User.create!(name: "testuser2", email: "testuser2@mail.com", password: 'password', password_confirmation: 'password')
user_third = User.create!(name: "testuser3", email: "testuser3@mail.com", password: 'password', password_confirmation: 'password')
user_fourth = User.create!(name: "testuser4", email: "testuser4@mail.com", password: 'password', password_confirmation: 'password')


first_keyboard = Keyboard.create(name: "first-keyboard", description: "first description", user: user)
second_keyboard = Keyboard.create(name: "second-keyboard", description: "second description", user: user_second)
third_keyboard = Keyboard.create(name: "third-keyboard", description: "third description", user: user)


first_keyboard.create_activity :like, owner: user_second
first_keyboard.create_activity :unlike, owner: user_second
second_keyboard.create_activity :like, owner: user
third_keyboard.create_activity :like, owner: user_second

second_keyboard.create_activity :follow, owner: user
second_keyboard.create_activity :unfollow, owner: user
second_keyboard.create_activity :follow, owner: user


user.create_activity :follow, owner: user_second
user.create_activity :unfollow, owner: user_second



second_keyboard.liked_by user
third_keyboard.liked_by user_second


second_keyboard.liked_by user


parent_commit = Commit.create!(name: "First kb's 1's commit", keyboard: first_keyboard)

Layer.create!(commit: parent_commit, vid: 1, layout: qwerty_layout, name: "first-1-layer", color: "#ff0000")
Layer.create!(commit: parent_commit, vid: 2, layout: qwerty_layout, name: "second-1-layer", color: "#00ff00")

(2..7).each do |index|
	commit = Commit.create!(name: "First kb's #{index}'s commit", keyboard: first_keyboard, parent: parent_commit)

	Layer.create!(commit: commit, vid: 1, layout: qwerty_layout, name: "first-#{index}-layer", color: "#ff0000")
	Layer.create!(commit: commit, vid: 2, layout: qwerty_layout, name: "second-#{index}-layer", color: "#00ff00")

	parent_commit = commit
end



parent_commit = Commit.create!(name: "Second kb's 1's commit", keyboard: second_keyboard)

Layer.create!(commit: parent_commit, vid: 1, layout: qwerty_layout, name: "first-1-layer", color: "#ff0000")
Layer.create!(commit: parent_commit, vid: 2, layout: qwerty_layout, name: "second-1-layer", color: "#00ff00")


(2..5).each do |index|
	commit = Commit.create!(name: "Second kb's #{index}'s commit", keyboard: second_keyboard, parent: parent_commit)

	Layer.create!(commit: commit, vid: 1, layout: qwerty_layout, name: "first-#{index}-layer", color: "#ff0000")
	Layer.create!(commit: commit, vid: 2, layout: qwerty_layout, name: "second-#{index}-layer", color: "#00ff00")
end


parent_commit = Commit.create!(name: "Third kb's 1's commit", keyboard: third_keyboard)

Layer.create!(commit: parent_commit, vid: 1, layout: qwerty_layout, name: "first-1-layer", color: "#ff0000")
Layer.create!(commit: parent_commit, vid: 2, layout: qwerty_layout, name: "second-1-layer", color: "#00ff00")


(2..11).each do |index|
	commit = Commit.create!(name: "Second kb's #{index}'s commit", keyboard: third_keyboard, parent: parent_commit)

	Layer.create!(commit: commit, vid: 1, layout: qwerty_layout, name: "first-#{index}-layer", color: "#ff0000")
	Layer.create!(commit: commit, vid: 2, layout: qwerty_layout, name: "second-#{index}-layer", color: "#00ff00")
end


first_talk = Talk.create(title: "first 1", data: "#OLA **1**", keyboard: first_keyboard, user: user)
second_talk = Talk.create(title: "first 2", data: "#OLA **2**", keyboard: first_keyboard, user: user)
third_talk = Talk.create(title: "first 3", data: "#OLA **3**", keyboard: first_keyboard, user: user_second)

fourth_talk = Talk.create(title: "second 4", data: "#OLA **4**", keyboard: second_keyboard, user: user_second)
fifth_talk = Talk.create(title: "second 5", data: "#OLA **5**", keyboard: second_keyboard, user: user)


Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)
Comment.create(data: "## comment First talk first comment", talk: first_talk, user: user_second)
Comment.create(data: "** comment First talk second comment", talk: first_talk, user: user)
Comment.create(data: "# comment First talk third comment", talk: first_talk, user: user_second)

Comment.create(data: "second talk first comment", talk: second_talk, user: user_second)
Comment.create(data: "second talk second comment", talk: second_talk, user: user)
Comment.create(data: "second talk third comment", talk: second_talk, user: user_second)

Comment.create(data: "third talk first comment", talk: third_talk, user: user_second)
Comment.create(data: "third talk second comment", talk: third_talk, user: user)
Comment.create(data: "third talk third comment", talk: third_talk, user: user_second)

Comment.create(data: "fourth talk first comment", talk: fourth_talk, user: user_second)
Comment.create(data: "fourth talk second comment", talk: fourth_talk, user: user)
Comment.create(data: "fourth talk third comment", talk: fourth_talk, user: user_second)

Comment.create(data: "fifth talk first comment", talk: fifth_talk, user: user_second)
Comment.create(data: "fifth talk second comment", talk: fifth_talk, user: user)
Comment.create(data: "fifth talk third comment", talk: fifth_talk, user: user_second)


Comment.create(data: "fifth talk first comment", talk: fifth_talk, user: user_third)
Comment.create(data: "fifth talk second comment", talk: fifth_talk, user: user_third)
Comment.create(data: "fifth talk third comment", talk: fifth_talk, user: user_third)


Comment.create(data: "fifth talk first comment", talk: fifth_talk, user: user_fourth)
Comment.create(data: "fifth talk second comment", talk: fifth_talk, user: user_fourth)
Comment.create(data: "fifth talk third comment", talk: fifth_talk, user: user_fourth)