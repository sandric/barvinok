class AddDescriptionToCommit < ActiveRecord::Migration[5.0]
  def change
    add_column :commits, :description, :text
  end
end
