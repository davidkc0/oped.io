class Post < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 1, maximum: 80}
	validates :body, presence: true, length: {minimum: 5, maximum: 5000}
	validates :tags, presence: true
	validates :user_id, presence: true
	belongs_to :user
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	has_many :comments, dependent: :destroy
	has_many :dabates, dependent: :destroy

	delegate :username, to: :user


	def all_tags=(names)
		self.tags = names.split(',').map do |name|
			Tag.where(name: name).first_or_create!
		end
	end

	def all_tags
		tags.map(&:name).join(',')
	end
end
