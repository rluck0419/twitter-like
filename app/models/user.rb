class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  validates :name, presence: true
  validates :handle, presence: true
  validates :email, presence: true
end
