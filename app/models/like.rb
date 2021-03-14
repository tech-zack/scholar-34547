class Like < ApplicationRecord
  belongs_to :scholar
  belongs_to :user

  validates_uniqueness_of :scholar_id, scope: :user_id
end
