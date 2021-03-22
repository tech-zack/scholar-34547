require 'rails_helper'
RSpec.describe "投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @scholar_text = Faker::Lorem.sentence
    @scholar_title = Faker::Lorem.sentence
  end
  context '投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      #ログインする
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # トップページにPOSTするボタンがあることを確認する
      expect(page).to have_content("POST")
      #投稿ページに移動する
      visit new_scholar_path
      #フォームに情報を入力する
      select 'エンタメ', from: 'scholar[category_id]'
      fill_in 'scholar[title]', with: @scholar_title
      fill_in 'scholar[text]', with: @scholar_text
      attach_file "scholar[image]", "public/images/test_image.png"
      #送信するとScholarモデルのカウントが1上がることを確認する
      expect{ find('input[name="commit"]').click
      }.to change { Scholar.count }.by(1)
      #トップページに遷移することを確認する
      visit root_path
      # トップページには先ほど投稿した内容の投稿が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png")
      # トップページには先ほど投稿した内容の投稿が存在することを確認する（タイトル）
      expect(page).to have_content(@scholarーtitle)
    end
  end
  context '投稿ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
      #ログインページに遷移する
      visit root_path
    end
  end
end
      
