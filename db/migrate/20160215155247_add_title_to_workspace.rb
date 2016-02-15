class AddTitleToWorkspace < ActiveRecord::Migration
  def change
    add_column :workspaces, :title, :string
  end
end
