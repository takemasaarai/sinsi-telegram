class Sinsi < ApplicationRecord
  is_impressionable # preview
  mount_uploader :picture, PictureUploader # upload
  validates :title, length: { maximum: 10, message: "は10文字以内に抑えてください" }
  validates :description, length: { maximum: 15, message: "は15文字以内に抑えてください" }
  validates :picture, presence: true
  validate :picture_size # 日本語があああ
  has_many :comments

  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "は3MBまでのファイルにしてください")
    end
  end
end
