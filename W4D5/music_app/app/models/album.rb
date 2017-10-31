class Album < ApplicationRecord
  validates :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :band_id }

  belongs_to :band
  has_many :tracks
end
