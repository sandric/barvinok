class AddSlugToKeyboard < ActiveRecord::Migration[5.0]
  def change
    add_column :keyboards, :slug, :string
  end
end
