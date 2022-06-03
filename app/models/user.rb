class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :chats
         
         #has_one_attached :image

         mount_uploader :image, ImageUploader

         with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数混合のpasswordを設定してください' } do
          validates :password
        end
      
        validates :nickname, presence: true
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :profile, presence: true
      
        
end
