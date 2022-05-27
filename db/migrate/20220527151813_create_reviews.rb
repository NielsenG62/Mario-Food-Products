class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :rating
      t.string :content_body
      t.integer :product_id

      t.timestamps
    end
  end
end
