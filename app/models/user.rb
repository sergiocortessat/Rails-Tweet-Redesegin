class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }
  validates :fullname, presence: true
  mount_uploader :photo, ImageUploader
  mount_uploader :background_image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :followed, foreign_key: 'followerid', class_name: 'Following', dependent: :destroy
  has_many :followers, foreign_key: 'followedid', class_name: 'Following', dependent: :destroy

  def not_following
    User.all.where.not(id: user_followings.select(:id)).where.not(id: id).order(created_at: :desc)
  end

  def self.find_friends(id)
    arr = [id]
    followed = Following.where(followerid: id).order(created_at: :desc)

    followed.each { |follow| arr.push(follow.followedid) } if followed.any?
    User.where.not(id: arr).order(created_at: :desc).limit(5)
  end

  def self.user_followers(id, curr_user_id)
    Following.where(followedid: id).where.not(followerid: curr_user_id).order(created_at: :desc).limit(10)
  end

  def already_follow?(user_id)
    true if Following.find_by(followerid: id, followedid: user_id)
  end

  def follow_user(user_id)
    Following.create(followerid: id, followedid: user_id)
  end
end
