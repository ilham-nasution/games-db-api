class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :image
      t.date :release_date
      t.integer :rating
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
