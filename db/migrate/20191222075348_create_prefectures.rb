class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.string :area

      t.timestamps
      
      t.index :name, unique: true
    end
  end
end
