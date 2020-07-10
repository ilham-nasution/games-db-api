class RemoveImageFromPlatforms < ActiveRecord::Migration[6.0]
  def change
    remove_column :platforms, :image, :string
  end
end
