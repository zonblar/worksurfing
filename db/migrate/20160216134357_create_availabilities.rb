class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :workspace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
