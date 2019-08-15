module CommentsHelper

  def comment_user_name
    return User.find(@comment.user_id).name
  end

end
