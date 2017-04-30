class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :body
      t.integer :rating
      t.text :username
    end
  end
end
