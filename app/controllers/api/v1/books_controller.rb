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
    id = params["id"]
    list = current_user.list
    entry = Read.new(book_id: id, list_id: list.id)
    if entry.valid?
      entry.save
      render json: {
        status: 'success'
      }
    else
      render json: {
        status: 'FAILURE'
      }
    end
  end

  def remove_from_list
    id = params["id"]
    list = current_user.list
    entry = Read.where(book_id: id, list_id: list.id)[0]
    if entry
      entry.destroy
      render json: {
        status: 'success'
      }
    else
      render json: {
        status: 'FAILURE'
      }
    end
  end
end
