class Sinsi < ApplicationRecord
  is_impressionable # preview
  mount_uploader :picture, PictureUploader # upload
  validates :title, length: { maximum: 30, message: "は30文字以内に抑えてください" }
  validates :word, length: { maximum: 30, message: "は30文字以内に抑えてください" }
  validates :picture, presence: true
  validate :picture_size

  belongs_to :user

  def user
    return User.find_by(id: self.user_id)
  end

  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "のサイズは3MBまでにしてください")
    end
  end
end
