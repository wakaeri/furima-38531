require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do # ユーザー新規登録についてのテストコードを記述します
    context '新規登録できるとき' do 
      it 'userの全項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'user_name_firstが空だと保存できないこと' do
        @user.user_name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name first can't be blank")
      end
      it 'user_name_firstが全角日本語でないと保存できないこと' do
        @user.user_name_first = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('User name first is invalid')
      end
      it 'user_name_first_readingが空だと保存できないこと' do
        @user.user_name_first_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name first reading can't be blank")
      end
      it 'user_name_first_readingが全角カタカナでないと保存できないこと' do
        @user.user_name_first_reading = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('User name first reading is invalid')
      end
      it 'user_name_lastが空だと保存できないこと' do
        @user.user_name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name last can't be blank")
      end
      it 'user_name_lastが全角日本語でないと保存できないこと' do
        @user.user_name_last = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('User name last is invalid')
      end
      it 'user_name_last_readingが空だと保存できないこと' do
        @user.user_name_last_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name last reading can't be blank")
      end
      it 'user_name_last_readingが全角カタカナでないと保存できないこと' do
        @user.user_name_last_reading = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('User name last reading is invalid')
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end  
  end
end
