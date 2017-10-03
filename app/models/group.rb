class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :group_users, dependent: :delete_all
  has_many :users, through: :group_users
  has_many :messages

  scope :desc, -> { order("groups.updated_at DESC") }

  def last_message
    if messages.last.try(:text)
      messages.last.text
    elsif messages.last.try(:image)
      '画像が投稿されています。'
    else
      'まだメッセージはありません'
    end
  end

end
