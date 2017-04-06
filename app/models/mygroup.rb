class Mygroup < ApplicationRecord
  belongs_to :user
  has_many :group_member
  has_many :users, through: :group_member
end
