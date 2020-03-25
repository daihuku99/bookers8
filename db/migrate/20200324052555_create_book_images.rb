class CreateBookImages < ActiveRecord::Migration[5.2]
  def change
    create_table :book_images do |t|
      t.string :title
      t.string :body
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
