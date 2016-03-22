module CommentHelper
	def show_comment_path(user, keyboard, talk, comment)
		"/#{user}/#{keyboard}/talks/#{talk.id}#comment_#{comment.id}"
	end
end
