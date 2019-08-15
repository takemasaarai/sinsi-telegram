class Like < ApplicationRecord
  belongs_to :user
  belongs_to :sinsi
  validates_uniqueness_of :sinsi_id, scope: :user_id
  validates :user_id, presence: true
  validates :sinsi_id, presence: true
end
