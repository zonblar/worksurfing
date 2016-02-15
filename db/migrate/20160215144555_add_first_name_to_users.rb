class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job, :string
    add_column :users, :portfolio, :string
    add_column :users, :description, :string
    add_column :users, :gender, :string

  end
end
