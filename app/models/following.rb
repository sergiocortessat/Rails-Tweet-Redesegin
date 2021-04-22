class Following < ApplicationRecord
  belongs_to :follower, foreign_key: 'followerid', class_name: 'User'
  belongs_to :followed, foreign_key: 'followedid', class_name: 'User'

  def self.find_friend_to_unfollow(sender_id, receiver_id)
    @following = Following.where(followerid: sender_id, followedid: receiver_id)
  end
end
