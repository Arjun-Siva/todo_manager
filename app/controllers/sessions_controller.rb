class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      render plain: "You are not one of us"
    end
  end
end
