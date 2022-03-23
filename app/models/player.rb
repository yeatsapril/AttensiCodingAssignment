class Player < ApplicationRecord
  has_many :playthroughs
  validates :name, presence: true
end
