class DeleteNameIdUniqIndexFromShrines < ActiveRecord::Migration[5.2]
  def change
    remove_index :shrines, :name
    add_index :shrines, [:address, :prefecture_id], :unique => true
  end
end
