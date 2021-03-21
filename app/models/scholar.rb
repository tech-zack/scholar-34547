class Scholar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :messages
  has_many :likes
  has_one_attached :image
  has_many :liked_users, through: :likes, source: :user
  
  validates :image, presence: true 
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
