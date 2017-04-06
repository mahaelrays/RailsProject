class GroupMember < ApplicationRecord
  belongs_to :mygroup
  belongs_to :user
end
