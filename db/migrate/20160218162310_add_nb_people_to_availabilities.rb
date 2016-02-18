class AddNbPeopleToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :nb_people, :integer
  end
end
