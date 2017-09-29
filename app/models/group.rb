class Group < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :group_users, dependent: :delete_all
  has_many :users, through: :group_users
  has_many :messages

  scope :desc, -> { order("groups.updated_at DESC") }
end
