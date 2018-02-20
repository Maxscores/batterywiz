class Category < ApplicationRecord
  has_many :appliances
  validates :title, presence: true, uniqueness: true
end
