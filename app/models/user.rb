class User < ApplicationRecord
  has_many :groups
  has_many :payments, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 50 }
end
