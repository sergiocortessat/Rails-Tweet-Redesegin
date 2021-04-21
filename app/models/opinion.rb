class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, presence: true, length: { maximum: 260 }
  has_many :likes, dependent: :destroy
end
