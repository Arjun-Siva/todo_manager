# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user_record = User.find_by email: email
    if (user_record != nil && user_record.password.to_s == password)
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
