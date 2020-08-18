class ImagePost < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { maximum: 60000 }
end
