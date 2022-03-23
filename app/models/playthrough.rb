class Playthrough < ApplicationRecord
  belongs_to :player
  validates :started_playing, :time_spent, :score, presence: true
end
