require 'rails_helper'

RSpec.describe Scholar, type: :model do
  before do
    @scholar = FactoryBot.build(:scholar)
  end

  describe '科目投稿' do
    context '科目投稿できるとき' do
      it 'title,text,category_id,imageが存在していれば保存できること' do
        expect(@scholar).to be_valid
      end
    end
  end

    context '科目投稿できないとき' do
      it 'titleが空では保存できないこと' do
        @scholar.title = nil
        @scholar.valid?
        expect(@scholar.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では保存できないこと' do
        @scholar.text = nil
        @scholar.valid?
        expect(@scholar.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @scholar.image = nil
        @scholar.valid?
        expect(@scholar.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では保存できないこと' do
        @scholar.category_id = nil
        @scholar.valid?
        expect(@scholar.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1では保存できないこと' do
        @scholar.category_id = 1
        @scholar.valid?
        expect(@scholar.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
