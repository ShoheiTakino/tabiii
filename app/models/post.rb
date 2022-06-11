class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :province


  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :favorites, dependent: :destroy
  geocoded_by :address
  after_validation :geocode

  def  favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_one_attached :image

  validates :title,       presence: true
  validates :content, length: { minimum: 1, maximum: 400 }
  validates :image,       presence: true
  validates :province_id, numericality: { other_than: 1, message: "can't be blank" }
end
