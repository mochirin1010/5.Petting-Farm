class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, { presence: true, length: { maximum: 100 } }
  validates :image, { presence: true }
  validates :user_id, { presence: true }
  belongs_to :user
  belongs_to :pet
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user, dependent: :destroy
  has_ancestry

  def user
    return User.find_by(id: self.user_id)
  end

  def pet
    return Pet.find_by(id: self.pet_id)
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
