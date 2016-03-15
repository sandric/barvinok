class CreateComment < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :data
      t.references :talk, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
