class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :text_or_image, :group_id, :user_id, presence:true

  belongs_to :group
  belongs_to :user

  private

  def text_or_image
    text.presence || image.presence
  end
end
