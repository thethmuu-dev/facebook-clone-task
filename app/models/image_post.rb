class ImagePost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, ImageUploader
  validates :content, presence: true, length: { maximum: 60000 }
end
