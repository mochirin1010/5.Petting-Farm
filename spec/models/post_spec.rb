require 'rails_helper'

RSpec.describe Post, type: :model do
  it "contentがなければ無効" do
    post = Post.new(
      content: nil,
      image: "test.png",
      user_id: 10,
      pet_id: 10,
    )
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it "contentが100文字以上の場合は無効" do
    post = Post.new(
      content: "a" * 100,
      image: "test.png",
      user_id: 10,
      pet_id: 10,
    )
    expect(post).to be_invalid
  end

  it "imageがなければ無効" do
    post = Post.new(
      content: "ワクワク",
      image: nil,
      user_id: 10,
      pet_id: 10,
    )
    post.valid?
    expect(post.errors[:image]).to include("を入力してください")
  end

  it "user_idがなければ無効" do
    post = Post.new(
      content: "ワクワク",
      image: "test.png",
      user_id: nil,
      pet_id: 10,
    )
    post.valid?
    expect(post.errors[:user_id]).to include("を入力してください")
  end
end
