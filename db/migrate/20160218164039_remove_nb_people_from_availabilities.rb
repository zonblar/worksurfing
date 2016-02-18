class RemoveNbPeopleFromAvailabilities < ActiveRecord::Migration
  def change
    remove_column :availabilities, :nb_people, :integer
  end
end
