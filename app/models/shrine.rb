class Shrine < ApplicationRecord
  belongs_to :prefecture
  validates :name, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 },
                      :uniqueness => { :scope => :prefecture_id }
                      
  has_many :reviews, dependent: :destroy
  has_many :reviews_user, through: :reviews
  has_many :concerns, dependent: :destroy
  has_many :concerns_user, through: :concerns
  has_many :reviews_pictures, through: :reviews, source: :pictures
  
  def self.shrine_search(search)
      Shrine.where(['name LIKE ?', "%#{search}%"])
  end
  
end