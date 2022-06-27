require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録できない場合' do
      it 'nicknameが空では登録ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameは1文字以上で入力してください')
      end
      it 'emailが空では登録ができない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailを入力してください')
      end
      it 'passwordが空では登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordを入力してください')
      end
      it 'last_nameが空では登録ができない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameを入力してください')
      end
      it 'first_nameが空では登録ができない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameを入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end
      it 'emailは@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは不正な値です')
      end
      it 'emailが重複する場合は登録することはできない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end
      it 'passwordが129文字以上の場合は登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは128文字以内で入力してください')
      end
      it 'passwordが5文字以下の場合は登録できない' do
        @user.password = '0000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください')
      end
      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password英数混合のpasswordを設定してください')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password英数混合のpasswordを設定してください')
      end
      it 'パスワードに全角文字を含むと登録できない' do
        @user.password = 'A1a1A1１'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password英数混合のpasswordを設定してください')
      end
    end
  end
end
