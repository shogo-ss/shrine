class CreateConcerns < ActiveRecord::Migration[5.2]
  def change
    create_table :concerns do |t|
      t.references :user, foreign_key: true
      t.references :shrine, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :shrine_id], unique: true
    end
  end
end
