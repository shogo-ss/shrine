class Went < ApplicationRecord
  belongs_to :user
  belongs_to :shrine
  #has_many :reviews, through: :users
end
