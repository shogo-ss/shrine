class Shrine < ApplicationRecord
  belongs_to :prefecture
  validates :name, presence: true, length: { maximum: 20 },
                   uniqueness: true #重複していないか検証
  validates :address, presence: true, length: { maximum: 50 }
end
