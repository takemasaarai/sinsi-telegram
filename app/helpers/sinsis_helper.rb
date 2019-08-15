module SinsisHelper

  def user_name
    return User.find(@sinsi.user_id).name
  end

end
