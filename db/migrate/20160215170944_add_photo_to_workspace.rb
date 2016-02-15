class AddPhotoToWorkspace < ActiveRecord::Migration
  def change
    add_column :workspaces, :photo1, :string
  end
end
