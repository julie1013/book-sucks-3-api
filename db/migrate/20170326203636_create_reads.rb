class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.integer :list_id
      t.integer :book_id
    end
  end
end
