class Scholar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :messages
  has_one_attached :image

  validates :title, presence: true 
  validates :text,  presence: true 
  validates :category_id, numericality: { other_than: 1 } 
  validates :title, presence: true, unless: :was_attached?
  validates :text, presence: true, unless: :was_attached?
  validates :category_id, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end
end
