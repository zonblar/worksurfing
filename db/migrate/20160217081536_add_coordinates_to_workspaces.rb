class AddCoordinatesToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :latitude, :float
    add_column :workspaces, :longitude, :float
  end
end
