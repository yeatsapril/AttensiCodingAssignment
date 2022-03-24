class Playthrough < ApplicationRecord
  belongs_to :player
  validates :started_playing, :finished_playing, :score, presence: true
end
