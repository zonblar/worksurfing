class AddNbPeopleToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :nb_people, :integer
  end
end
