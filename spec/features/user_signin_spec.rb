require "rails_helper"

RSpec.feature "User sign in" do 
	
	background do
		@User = create(:user) 
	end

	scenario "successfuly"
	sign_in @user 

	expect(page).to have_conntent @user.email 
end

scenario "unsuccessfuly" do 
	vist new_user_session_path 
	fill_in "Email", with: "wrongemail"
	fill_in "Password", with: "wrongpassword"
	click_on "Log in"

	expect(page).not_to have_conntent @user.email 


 end



