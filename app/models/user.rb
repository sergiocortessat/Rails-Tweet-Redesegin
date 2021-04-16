class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  mount_uploader :photo, ImageUploader
  mount_uploader :background_image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followers, foreign_key: 'followerid', class_name: 'Following'
  has_many :followed, foreign_key: 'followedid', class_name: 'Following'
end
