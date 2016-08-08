require "rails_helper"

RSpec.describe "user signing up" do 
	scenario "successfuly"
		vist new_user_registration_path
		fill_in "First Name", with: "Johhny"
		fill_in "Last Name", with: "Appleseed"
		fill_in "Email", with: "test@est.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_on "Sign up"

		expect(page).to have_conntent "test@est.com"
end

	scenario "unsuccessfuly"
		vist new_user_registration_path
		fill_in "Email", with: "test@est.com"
		fill_in "Password", with: ""
		fill_in "Password confirmation", with: "password"
		click_on "Create acount"

		expect(page).to have_conntent "error"
end