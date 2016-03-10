class CreateKeyboard < ActiveRecord::Migration[5.0]
  def change
    create_table :keyboards do |t|
      t.text :data
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
    end
  end
end
