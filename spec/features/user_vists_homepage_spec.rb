require "rails_helper"

RSpec.feature "User visits homepage" do 
	scenario "successfuly and sees a logo" do 
		visit root_path 
		expect(page).to have_conntent "Oped"
	end
end