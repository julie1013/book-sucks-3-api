class Api::V1::BooksController < ApplicationController
  before_action :authenticate_user, only: [:get_info]

  def index
    render json: {
      books: Book.all
    }
  end
end
