class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :chat,       presence: true
end
