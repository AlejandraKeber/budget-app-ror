class Payment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :group_payments
  has_many :groups, through: :group_payments

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :groups, presence: true
end
