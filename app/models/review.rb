class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shrine
  validates :evaluation, presence: true
  
end
