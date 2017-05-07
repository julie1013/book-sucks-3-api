class Api::V1::BooksController < ApplicationController
  before_action :authenticate_user, only: [:get_info, :get_list, :add_to_list,
    :remove_from_list, :add_review, :delete_review, :current_user]

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

  def get_reviews
    id = params["id"]
    reviews = Review.where(book_id: id)
    render json: {reviews: reviews}
  end

  def add_review
    user = current_user
    id = params["id"]
    body = params["body"]
    rating = 5
    review = Review.new(
      user_id: user.id,
      book_id: id,
      body: body,
      rating: rating,
      username: current_user.display_name
    )
    if review.valid?
      review.save
      render json: {review: review}
    else
      render json: {errors: review.errors.full_messages}
    end
  end

  def delete_review
    user = current_user
    id = params["id"]
    review = Review.find(id)
    if review && review.user.id == current_user.id
      review.destroy
      render json: {deleted: review.id}
    else
      render json: {error: 'review not found or is not yours'}
    end
  end

  def edit_review
    user = current_user
    id = params["id"]
    body = params["body"]
    review = Review.find(id)
    review.body = body
    review.save
    render json: {review: review}
  end
end
