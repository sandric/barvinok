class AddSlugToLayer < ActiveRecord::Migration[5.0]
  def change
    add_column :layers, :slug, :string
  end
end
