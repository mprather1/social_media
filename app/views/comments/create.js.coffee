$('#new-comment').val('')
html = "<%= escape_javascript(render partial: 'comment', locals: {comment: @comment}) %>"
$("#comment-list").append(html)
