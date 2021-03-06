class Like < ApplicationRecord
  belongs_to :consultation
  belongs_to :user
  validates_uniqueness_of :consultation_id, scope: :user_id
end
