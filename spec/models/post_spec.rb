require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿機能' do
    context '新規投稿ができる場合' do
      it 'image,title,content,province_idが存在すれば出品する' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it 'imageが空では投稿ができない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Imageを入力してください')
      end
      it 'titleが空では投稿ができない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Titleは1文字以上で入力してください')
      end
      it 'titleは21文字以上では投稿ができない' do
        @post.title = 'aaaaaaaaaaaaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include('Titleは20文字以内で入力してください')
      end
      it 'contentが空では投稿ができない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Contentは1文字以上で入力してください')
      end
      it 'contentは401以上では投稿ができない' do
        @post.content = 'a' * 401
        @post.valid?
        expect(@post.errors.full_messages).to include('Contentは400文字以内で入力してください')
      end
      it 'province_idが空では投稿ができない' do
        @post.province_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Provincecan't be blank")
      end
      it 'userと紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
