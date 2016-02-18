class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating, default: 0
      t.references :workspace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
