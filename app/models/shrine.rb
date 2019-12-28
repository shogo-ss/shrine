class Shrine < ApplicationRecord
  belongs_to :prefecture
  validates :name, presence: true, length: { maximum: 20 },
                   uniqueness: true #重複していないか検証
  validates :address, presence: true, length: { maximum: 50 }
  
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :wents, dependent: :destroy
  has_many :users, through: :wents
  has_many :concerns, dependent: :destroy
  has_many :users, through: :concerns
  
end