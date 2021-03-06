class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.bigint :evaluation
      t.references :user, foreign_key: true
      t.references :shrine, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :shrine_id], unique: true
    end
  end
end
