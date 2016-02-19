class AddListedToWorkspace < ActiveRecord::Migration
  def change
    add_column :workspaces, :listed, :boolean, default: true
  end
end

