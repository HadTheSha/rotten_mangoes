class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :image
  end
end
