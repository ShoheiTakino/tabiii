class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :province


  belongs_to :user
  has_many   :chats 

  has_one_attached :image

  validates :title,       presence: true
  validates :content,     presence: true
  validates :image,       presence: true
  validates :province_id, numericality: { other_than: 1, message: "can't be blank" }
end
