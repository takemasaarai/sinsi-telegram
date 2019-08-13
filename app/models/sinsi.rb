class Sinsi < ApplicationRecord
  is_impressionable # preview
  mount_uploader :picture, PictureUploader # upload

  has_many :comments
end
