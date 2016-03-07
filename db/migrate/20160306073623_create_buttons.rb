class CreateButtons < ActiveRecord::Migration[5.0]
  def change
    create_table :buttons do |t|
      t.integer :row
      t.integer :column
      t.string :value
      t.belongs_to :layer, foreign_key: true
    end
  end
end
