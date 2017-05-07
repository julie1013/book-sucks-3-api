class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: [:get_info]

  def get_info
    user = current_user
    name = user.display_name
    render json: {
      info: {
        name: name,
        numberOfReads: 0
      }
    }
  end

  def signup
    email = params["email"]
    password = params["password"]
    display_name = params["displayName"]
    user = User.new(email: email, password: password, display_name: display_name)
    if user.valid?
      user.save
      render json: {status: 'success!'}
    else
      render json: {errors: user.errors.full_messages}
    end
  end
end
