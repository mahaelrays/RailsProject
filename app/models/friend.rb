class Friend < ApplicationRecord
  # belongs_to :user
  self.primary_keys = :user_id, :friend_id
   belongs_to :user
   belongs_to :user
  #  has_many :statuses, :class_name => 'Friend', :foreign_key => [:user_id, :friend_id]
  belongs_to :Friend, :foreign_key => [:user_id, :friend_id]
end
