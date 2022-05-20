require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "山田",last_name_katakana: "タロウ",first_name_katakana: "ヤマダ",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "山田",last_name_katakana: "タロウ",first_name_katakana: "ヤマダ",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "",first_name: "山田",last_name_katakana: "タロウ",first_name_katakana: "ヤマダ",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "",last_name_katakana: "タロウ",first_name_katakana: "ヤマダ",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_katakanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "山田",last_name_katakana: "",first_name_katakana: "ヤマダ",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name katakana can't be blank")
    end
    it "first_name_katakanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "山田",last_name_katakana: "タロウ",first_name_katakana: "",birthday: "2000/01/01")
      user.valid?
      expect(user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: "太郎",first_name: "山田",last_name_katakana: "タロウ",first_name_katakana: "ヤマダ",birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  
end
