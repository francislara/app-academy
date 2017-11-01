# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User,
    inverse_of: :subs

  has_many :posts,
    through: :post_subs,
    source: :post

  has_many :post_subs,
    inverse_of: :sub,
    dependent: :destroy

  validates :title, uniqueness: true
  validates :description, presence: true
end
