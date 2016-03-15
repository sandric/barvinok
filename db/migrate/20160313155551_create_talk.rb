class CreateTalk < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.text :data
      t.string :title
      t.references :keyboard, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
