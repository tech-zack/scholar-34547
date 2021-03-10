class Scholar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user,   optional: true
  belongs_to :message,optional: true
  has_one_attached :image

  validates :title, presence: true 
  validates :text,  presence: true 
  validates :category_id, numericality: { other_than: 1 } 

end
