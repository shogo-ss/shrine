class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 },
                   uniqueness: true #重複していないか検証
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } #重複していないか検証、大文字小文字区別
  mount_uploader :user_image, ImageUploader
  
  has_secure_password
  
  has_many :reviews
  has_many :reviews_shrine, through: :reviews, source: :shrine
  has_many :concerns
  has_many :concerns_shrine, through: :concerns, source: :shrine
  has_many :reviews_pictures, through: :reviews, source: :pictures
  #has_many :reviews_pictures, through: :reviews_shrine, source: :pictures
  
  def review?(shrine)
    self.reviews_shrine.include?(shrine)
  end
  
  def concern(shrine)
      self.concerns.find_or_create_by(shrine_id: shrine.id)
  end
  
  def unconcern(shrine)
    concern = self.concerns.find_by(shrine_id: shrine.id)
    concern.destroy if concern
  end
  
  def concern?(shrine)
    self.concerns_shrine.include?(shrine)
  end
  
end
