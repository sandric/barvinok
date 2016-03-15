class AddParentToCommit < ActiveRecord::Migration[5.0]
  def change
    add_column :commits, :parent_id, :integer
  end
end
