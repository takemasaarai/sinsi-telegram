class Comment < ApplicationRecord
  validates :body, length: { maximum: 50, message: "は50文字以内に抑えてください" }
  validates :body, presence: true
  belongs_to :user
  belongs_to :sinsi

end
