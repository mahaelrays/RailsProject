
<h1>List All Users</h1>

<table >
  <thead>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Email</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @users.each do |user, i| %>
      <tr>
        # <td><%= user.id %></td>
        <td><%= user.name %></td>
        # <td><%= user.email %></td>
        <% friend_status = current_user.friendships.exists?(:friend_id =>user.id, :user_id => current_user.id)  ? true : false %>
        <% if(friend_status) %>
        <% friendship_id = current_user.friendships.where("friend_id = ? AND user_id = ?", user.id, current_user.id).first.id %>
          <td ">
    <%= link_to "Remove Friend", friendship_path(friendship_id), :method => :delete %></td>
        <td >Already Friends</td>
        <% elsif(current_user.id==user.id) %>
          <td ">You</td>
        <% else %>
          <td ><%= link_to 'Add Friend', friendships_path(:friend_id => user), :method => :post %></td>
        <% end %>

        <% if(current_user.id==user.id) %>
          <td ><%= link_to 'Show', user %></td>
          <td><%= link_to 'Edit', edit_user_path(user) %></td>
          <td "></td>
        <% else %>
        <td "><%= link_to 'Destroy', user, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        <% end %>
      </tr>
    <% end %>
  </tbody>
</table>

<br>
