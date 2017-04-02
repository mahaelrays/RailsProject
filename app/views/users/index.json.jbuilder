json.array! @users, partial: 'users/user', as: :user


<%= link_to "Add Friend", friendships_path(:friend_id => user), :method => :post %>
