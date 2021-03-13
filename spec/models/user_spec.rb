require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmationがあると登録できる' do
         expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it'passwordが空では登録できない'do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it'passwordが存在してもpassword_confirmationが空では登録できない'do
        @user.password_confirmation = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailは一意性出ないと登録できない'do
        @user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end 
      it 'emailは@がないと登録できない'do
        @user.email = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end 
      it 'passwordは６文字以下では登録できない'do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end 
    end
  end
end