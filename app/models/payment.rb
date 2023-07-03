class Payment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :groups, presence: true
end
