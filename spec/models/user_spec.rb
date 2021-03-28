require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスがなければ無効" do
    user = User.new(
      email: nil,
      password: "111111",
      username: "testname",
      user_img: "test.png",
      introduction: "初めまして。",
    )
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードがなければ無効" do
    user = User.new(
      email: "test@.com",
      password: nil,
      username: "testname",
      user_img: "test.png",
      introduction: "初めまして。",
    )
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
end
