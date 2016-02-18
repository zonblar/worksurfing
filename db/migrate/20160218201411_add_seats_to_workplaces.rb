class AddSeatsToWorkplaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :seats, :integer
  end
end
