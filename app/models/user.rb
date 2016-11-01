class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
  foreign_key: "follwed_id",
  dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships, class_name: "Relationship",
  foreign_key: "follower_id",
  dependent: :destroy

  has_many :followings, through: :active_relationships, source: :followed
  has_many :debates, dependent: :destroy
  def follow(other_user)
  	active_relationships.create(follwed_id: other_user.id)
  end

  def unfollow(other_user)
  	active_relationships.find_by(follwed_id: other_user.id).destroy
  end

  def following?(other_user)
  	following_ids.include?(other_user.id)
  end

  validates :username, presence: true

  mount_uploader :avatar, AvatarUploader
end
