class Group < ActiveRecord::Base
  groupify :group
  groupify :group, members: [:users], default_members: :users
end
