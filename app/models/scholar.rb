class Scholar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user,   optional: true
  belongs_to :comment,optional: true

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :category_id, numericality: { other_than: 1 } 

end
