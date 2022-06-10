class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :Favorites, dependent: :destroy
         has_many :follows
         has_many :followings, through: :follows, source: :follow
         has_many :reverse_of_follows, class_name: 'follow', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_follows, source: :user
         has_many :sns_credentials

         def self.from_omniauth(auth)
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
          user = User.where(email: auth.info.email).first_or_initialize(
            nickname: auth.info.name,
              email: auth.info.email
          )
          if user.persisted?
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }
         end
         

         def follow(other_user)
          unless self == other_user
            self.follows.find_or_create_by(follow_id: other_user.id)
          end
         end

         def unfollow(other_user)
          follow = self.follows.find_by(follow_id: other_user.id)
          follow.destroy if follow
         end

         def following?(other_user)
          self.followings.include?(other_user)
         end

         has_one_attached :profile_image

         mount_uploader :profile_image, ImageUploader

         with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数混合のpasswordを設定してください' } do
          validates :password
        end
      
        validates :nickname, length: { minimum: 1, maximum: 20 }
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :profile, length: { minimum: 1, maximum: 200 }
      
        
end
