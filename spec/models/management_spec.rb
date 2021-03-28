require 'rails_helper'

RSpec.describe Management, type: :model do
  it "titleがなければ無効" do
    management = Management.new(
      title: nil,
      content: "ノートに記録する",
      start_time: 2021-01-01010000,
      end_time: 2021-01-02010000,
      user_id: 10,
      pet_id: 10,
    )
    management.valid?
    expect(management.errors[:title]).to include("を入力してください")
  end

  it "titleが10文字以上の場合は無効" do
    management = Management.new(
      title: "a" * 10,
      content: "ノートに記録する",
      start_time: 2021-01-01010000,
      end_time: 2021-01-02010000,
      user_id: 10,
    )
    expect(management).to be_invalid
  end

  it "contentが100文字以上の場合は無効" do
    management = Management.new(
      title: "体重測定",
      content: "a" * 100,
      start_time: 2021-01-01010000,
      end_time: 2021-01-02010000,
      user_id: 10,
    )
    expect(management).to be_invalid
  end

  it "pet_idがなければ無効" do
    management = Management.new(
      title: "体重測定",
      content: "ノートに記録する",
      start_time: 2021-01-01010000,
      end_time: 2021-01-02010000,
      user_id: 10,
      pet_id: nil,
    )
    management.valid?
    expect(management.errors[:pet_id]).to include("を入力してください")
  end

  it "user_idがなければ無効" do
    management = Management.new(
      title: "体重測定",
      content: "ノートに記録する",
      start_time: 2021-01-01010000,
      end_time: 2021-01-02010000,
      user_id: nil,
      pet_id: 10,
    )
    management.valid?
    expect(management.errors[:user_id]).to include("を入力してください")
  end

  it "start_timeがなければ無効" do
    management = Management.new(
      title: "体重測定",
      content: "ノートに記録する",
      start_time: nil,
      end_time: 2021-01-02010000,
      user_id: 10,
      pet_id: 10,
    )
    management.valid?
    expect(management.errors[:start_time]).to include("を入力してください")
  end

  it "end_timeがなければ無効" do
    management = Management.new(
      title: "体重測定",
      content: "ノートに記録する",
      start_time: 2021-01-01010000,
      end_time: nil,
      user_id: 10,
      pet_id: 10,
    )
    management.valid?
    expect(management.errors[:end_time]).to include("を入力してください")
  end
end
