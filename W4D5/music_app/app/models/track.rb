class Track < ApplicationRecord
  validates :title, :ord
  validates :bonus, inlcusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }

  belongs_to :album
end
