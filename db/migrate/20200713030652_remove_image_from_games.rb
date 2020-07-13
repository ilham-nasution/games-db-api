class RemoveImageFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :image, :string
  end
end
