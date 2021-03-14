class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,presence: true

  has_many :messages
  has_many :scholars, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_scholars, through: :likes, source: :scholar
  has_many :post

  def already_liked?(scholar)
    self.likes.exists?(scholar_id: scholar.id)
  end
end
