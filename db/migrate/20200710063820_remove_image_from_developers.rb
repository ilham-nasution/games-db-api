class RemoveImageFromDevelopers < ActiveRecord::Migration[6.0]
  def change
    remove_column :developers, :image, :string
  end
end
