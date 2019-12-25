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
  has_many :shrines, through: :reviews
  
end
