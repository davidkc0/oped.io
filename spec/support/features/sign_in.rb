module Features 
	def sign_in(user)
	vist new_user_session_path 
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_on "Log in" 

	end
