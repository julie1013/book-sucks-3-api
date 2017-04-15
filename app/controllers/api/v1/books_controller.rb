class Api::V1::BooksController < ApplicationController
  before_action :authenticate_user, only: [:get_info, :get_list, :add_to_list,
    :remove_from_list]

  def index
    render json: {
      books: Book.all
    }
  end

  def get_list
    books = current_user.list.books
    render json: {
      books: books
    }
  end

  def add_to_list
    render json: {
      status: "hi"
    }
  end

  def remove_from_list
    render json: {
      status: "hi"
    }
  end
end
