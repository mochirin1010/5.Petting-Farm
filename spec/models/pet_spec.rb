require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "nameがなければ無効" do
    pet = Pet.new(
      name: nil,
      age: "2歳",
      pet_type: 10,
      gender: 10,
      introduction: 10,
      user_id: 10,
      pet_img: "pet.png",
    )
    pet.valid?
    expect(pet.errors[:name]).to include("を入力してください")
  end

  it "introductionが150文字以上の場合は無効" do
    pet = Pet.new(
      name: "もも",
      age: "2歳",
      pet_type: 10,
      gender: 10,
      introduction: "a" * 150,
      user_id: 10,
      pet_img: "pet.png",
    )
    expect(pet).to be_invalid
  end
end
