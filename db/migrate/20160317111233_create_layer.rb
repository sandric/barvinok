class CreateLayer < ActiveRecord::Migration[5.0]
  def change
    create_table :layers do |t|
      t.string :name
      t.string :color
      t.integer :vid
      t.text :layout
      t.references :commit, foreign_key: true
    end
  end
end
