class SearchHistory < ApplicationRecord
  belongs_to :user

  validates :city, presence: true
  validates :searched_at, presence: true
end
