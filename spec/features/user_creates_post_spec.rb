require "rails_helper"

RSpec.describe "creating post"

	scenario "successfuly" do 
		visit root_path
		click_on "write story"

		fill_in  "title", with: "my first post"
		fill_in "body", with: "content"
		click_on "publish"

		expect(page) to.have_conntent "my first post"

	scenario "unsuccessfuly"
		visit root_path
		click_on "write a story"

		fill_in "title", with: "my second post"
		fill_in "body", with: ""
		click_on "Publish"

		expect(page).to have_css ".error"
		

	end
end
