class User < ApplicationRecord
  acts_as_followable
   acts_as_follower
   has_many :mygroups


has_many :friendships
has_many :friends, :through => :friendships
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

after_destroy_commit { notify }

def notify
  Notification.create(event: "New Notification\n")
end

 def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
 end



#  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
#     data = access_token.info
#     user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
#     if user
#       return user
#     else
#       registered_user = User.where(:email => access_token.info.email).first
#       if registered_user
#         return registered_user
#       else
#         user = User.create(name: data["name"],
#           provider:access_token.provider,
#           email: data["email"],
#           uid: access_token.uid ,
#           password: Devise.friendly_token[0,20],
#         )
#       end
#    end
# end

end
