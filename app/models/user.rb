class User < ApplicationRecord
  mount_uploader :user_img, UserimgUploader
  validates :introduction, { length: { maximum: 100 } }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable
  has_many :posts, dependent: :destroy
  has_many :pets, dependent: :destroy
  has_many :managements, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post, dependent: :destroy

  def posts
    return Post.where(user_id: self.id)
  end
end
