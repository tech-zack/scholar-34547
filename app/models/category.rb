class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'エンタメ' },
    { id: 3, name: '芸術、デザイン' },
    { id: 4, name: 'コンピュータ、IT' },
    { id: 5, name: '料理、食べ物、飲み物' },
    { id: 6, name: 'スポーツ、格闘技' },
    { id: 7, name: '動物、生物、植物' },
    { id: 8, name: 'サイエンス' },
    { id: 9, name: '数学、算数' },
    { id: 10, name: '言語' },
    { id: 11, name: '歴史、人物' },
    { id: 12, name: '病気、健康、医療' }
  ]

  include ActiveHash::Associations
  has_many :scholars
  end