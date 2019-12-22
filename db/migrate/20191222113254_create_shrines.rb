class CreateShrines < ActiveRecord::Migration[5.2]
  def change
    create_table :shrines do |t|
      t.string :name
      t.string :address
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
