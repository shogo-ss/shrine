class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shrine
  validates :evaluation, presence: true
  
  has_many :pictures, inverse_of: :review, dependent: :destroy
  accepts_nested_attributes_for :pictures
  
end
