class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
    end
  end
end
