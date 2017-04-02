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
end
