require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が出来るとき' do
        it '全ての項目が正しければ登録できること' do
          expect(@user).to be_valid
        end

        it '本名は漢字での登録が出来ること' do
          @user.name = '某'
          expect(@user).to be_valid
        end

        it '本名はひらがなでの登録が出来ること' do
          @user.name = 'ああああ'
          expect(@user).to be_valid
        end

        it '本名はカタカナでの登録が出来ること' do
          @user.name = 'カ'
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = 'aaa123456'
          @user.password_confirmation = 'aaa123456'
          expect(@user).to be_valid
        end
      end
    end

    context '新規登録ができないとき' do
      it 'nameが空では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'aaa123456'
        @user.password_confirmation = 'aaa123456'
        expect(@user).to be_valid
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12aa5'
        @user.password_confirmation = '1aaa5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456aa'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '本名は苗字が空では登録出来ないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '本名は名前が空では登録出来ないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '本名のフリガナは苗字が空では登録出来ないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '本名のフリガナは名前が空では登録出来ないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '生年月日が空では登録出来ないこと' do
        @user.date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date can't be blank")
      end

      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'a'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = 'カ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')

        it 'last_name_kanaが全角カタカナ以外では登録できないこと' do
          @user.last_name_kana = 'カ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
      end
    end
  end
end
