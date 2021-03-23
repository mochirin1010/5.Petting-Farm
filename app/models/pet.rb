class Pet < ApplicationRecord
  mount_uploader :pet_img, PetimgUploader
  validates :name, { presence: true }
  validates :introduction, { length: { maximum: 150 } }
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :managements, dependent: :destroy
end
