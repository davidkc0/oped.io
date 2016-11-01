class Comment < ActiveRecord::Base
	if :name == nil 
		"annon" 
	end 
  validates :body, presence: true, length: {minimum: 5, maximum: 120}
  belongs_to :post
  belongs_to :user
end
