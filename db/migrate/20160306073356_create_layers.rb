class CreateLayers < ActiveRecord::Migration[5.0]
  def change
    create_table :layers do |t|
      t.string :name
      t.belongs_to :keyboard, foreign_key: true
    end
  end
end
