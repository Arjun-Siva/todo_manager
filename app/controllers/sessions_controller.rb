class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render plain: "You are in"
    else
      render plain: "You are not one of us"
    end
  end
end
