class Management < ApplicationRecord
  validates :title, { presence: true, length: { maximum: 15 } }
  validates :content, { length: { maximum: 100 } }
  validates :pet_id, { presence: true }
  validates :user_id, { presence: true }
  belongs_to :user
  belongs_to :pet

  def pet
    return Pet.find_by(id: self.pet_id)
  end
end
