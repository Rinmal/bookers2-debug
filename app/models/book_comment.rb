class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment, length: {minimum: 1, maximum: 100}
end
