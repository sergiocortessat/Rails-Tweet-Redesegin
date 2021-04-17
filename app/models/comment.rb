class Comment < ApplicationRecord
  belongs_to :opinion
  belongs_to :user
  has_many :likes, dependent: :destroy
end
