require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do

      it "email,password,nicname,first_name,last_name,first_name_hurigana,last_name_hurigana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end  
    end
    
    context "新規登録できない場合" do

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは@がない場合登録できない" do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
    
      it "passwordが5文字以下では登録できない" do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  
      end
  
      it "passwordはアルファベットのみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
  
      it "passwordは数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "passwordは全角では登録できない" do
        @user.password = "１２３ＡＢＣ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
  
      it "nicknameは空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "first_nameは空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "first_nameはアルファベットでは登録できない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
  
      it "first_nameは半角では登録できない" do
        @user.first_name = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
  
      it "last_nameは空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it "last_nameはアルファベットでは登録できない" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
  
      it "last_nameは半角では登録できない" do
        @user.last_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
  
      it "first_name_huriganaは空では登録できない" do
        @user.first_name_hurigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
      end
  
      it "first_name_huriganaは漢字では登録できない" do
        @user.first_name_hurigana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana is invalid. Input full-width katakana characters")
      end
      
      it "first_name_huriganaはひらがなでは登録できない" do
        @user.first_name_hurigana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "first_name_huriganaはアルファベットでは登録できない" do
        @user.first_name_hurigana = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "first_name_huriganaは半角では登録できない" do
        @user.first_name_hurigana = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "last_name_huriganaは空では登録できない" do
        @user.last_name_hurigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "last_name_huriganaは漢字では登録できない" do
        @user.last_name_hurigana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana is invalid. Input full-width katakana characters")
      end
      
      it "last_name_huriganaはひらがなでは登録できない" do
        @user.last_name_hurigana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "last_name_huriganaはアルファベットでは登録できない" do
        @user.last_name_hurigana = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "last_name_huriganaは半角では登録できない" do
        @user.last_name_hurigana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hurigana is invalid. Input full-width katakana characters")
      end
  
      it "birthdayは空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end 