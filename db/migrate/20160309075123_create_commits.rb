class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.text :data
      t.string :name
      t.references :keyboard, foreign_key: true
    end
  end
end
