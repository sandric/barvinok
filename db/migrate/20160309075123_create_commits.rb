class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.string :name
      t.integer :parent_id
      t.references :keyboard, foreign_key: true
    end
  end
end
