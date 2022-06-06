class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :Favorites, dependent: :destroy

         class Follow < ApplicationRecord
         has_many :follower, class_name: "follow", foreign_key: "follower_id", dependent: :destroy
         has_many :followed, class_name: "follow", foreign_key: "followed_id", dependent: :destroy
         has_many :following_user, through: :follower, source: :followed
         has_many :follower_user, through: :followed, source: :follower
         

         def follow(user_id)
          follower.create(followed_id: user_id)
         end

         def unfollow(user_id)
          follower.find_by(followed_id: user_id).destroy
         end

         def following?(user)
          following_user.include?(user)
         end
        end

         has_one_attached :profile_image

         mount_uploader :profile_image, ImageUploader

         with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数混合のpasswordを設定してください' } do
          validates :password
        end
      
        validates :nickname, presence: true
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :profile, length: { minimum: 1, maximum: 200 }
      
        
end
