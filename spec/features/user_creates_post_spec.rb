require "rails_helper"

RSpec.describe "creating post"
	let(:user) {create(:user)}
	scenario "successfuly" do 
		sign_in user
		visit root_path
		click_on "write story"

		fill_in  "title", with: "my first post"
		fill_in "body", with: "content"
		click_on "publish"

		within(".posts") do 
			expect(page).to have_conntent "my first post" 
			expect(page).to have_conntent user.username
		end
	end

	scenario "unsuccessfuly" do
		sign_in user
		visit root_path
		click_on "write a story"

		fill_in "title", with: "my second post"
		fill_in "body", with: ""
		click_on "Publish"

		expect(page).to have_css ".error"
	end
		
		scenario "non-logged in user connot create post" do 
			visit_root_path 
			click_on "Write an opinion piece" 

			expect(current_path).to eq(new_user_session_path) 
		end


end 
			
		

	