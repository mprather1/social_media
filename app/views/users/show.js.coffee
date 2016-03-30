show = "<%= escape_javascript(render partial: 'users/user', locals: {user: @user}) %>"
$("#pages-article").html(show)
