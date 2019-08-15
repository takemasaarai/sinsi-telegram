class Comment < ApplicationRecord
  validates :body, length: { maximum: 30, message: "は30文字以内に抑えてください" }
  validates :body, presence: true
  belongs_to :user
  belongs_to :sinsi

end
