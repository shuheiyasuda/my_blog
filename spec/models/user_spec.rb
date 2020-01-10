require 'rails_helper'
describe User do
  describe '#create' do
    #nickname, email, password, first_name, last_name, year_id, month_id, date_idがあれば登録できること
    it "is valid with a nickname, email, password, first_name, last_name, year_id, month_id, date_id" do
      user = build(:user)
      expect(user).to be_valid
    end

    #nicknameが空だと登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname:"")
      user.valid?
      expect(user.errors["nickname"]).to include("を入力してください")
    end

    #emailが空だと登録できないこと
    it "is invalid without a email" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    #passwordが空だと登録できないこと
    it "is invalid without a email" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    #year_idが空だと登録できないこと
    it "is invalid without a year_id" do
      user = build(:user, year_id:"")
      user.valid?
      expect(user.errors[:year_id]).to include("を選択して下さい")
    end

    #month_idが空だと登録できないこと
    it "is invalid without a month_id" do
      user = build(:user, month_id:"")
      user.valid?
      expect(user.errors[:month_id]).to include("を選択して下さい")
    end

    #year_idが空だと登録できないこと
    it "is invalid without a date_id" do
      user = build(:user, date_id:"")
      user.valid?
      expect(user.errors[:date_id]).to include("を選択して下さい")
    end

    #nicknameが7文字以上だと登録できないこと
    it "is invalid with a nickname that has more that 7 characters" do
      user = build(:user, nickname:"フットボール太郎")
      user.valid?
      expect(user.errors[:nickname]).to include("は6文字以内で入力してください")
    end

    #nicknameが6文字以内だと登録できること
    it "is valid with a nickname that has less than 6 characters" do
      user = build(:user, nickname:"安田さん")
      expect(user).to be_valid
    end

    #重複したnicknameが存在する場合登録できないこと
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    #重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    #重複したphone_numberが存在する場合登録できないこと
    it "is invalid with a duplicate phone_number" do
      user = create(:user)
      another_user = build(:user, email: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("はすでに存在します")
    end

    #passwordが6文字以上だと登録ができる
    it "is vaild with a password that has more than 6 characters" do
      user = build(:user, password:"11111111")
      expect(user).to be_valid
    end
  end
end