class Message < ApplicationRecord
  validates :talk, presence: true
  belongs_to :user
  belongs_to :room
end
