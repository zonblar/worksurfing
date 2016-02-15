class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.string :city
      t.integer :zipcode
      t.text :description
      t.string :address
      t.boolean :wifi
      t.boolean :bathroom
      t.text :rules
      t.boolean :printer
      t.boolean :printer
      t.integer :price_per_day
      t.integer :price_per_week
      t.string :type_of_space
      t.references :user

      t.timestamps null: false
    end
  end
end
