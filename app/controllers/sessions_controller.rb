class SessionsController < ApplicationController
  def new
  end

  def create
    # render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 重定向到用户页面
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # redirect user_path(user)
      redirect_to user
    else
      # 创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
