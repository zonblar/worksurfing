class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :accepted
      t.references :workspace, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.timestamps null: false
      t.string :workspace_sku
      t.json :payment
    end
  end
end


