class Message < ApplicationRecord
  belongs_to :scholar
  belongs_to :user 
end
