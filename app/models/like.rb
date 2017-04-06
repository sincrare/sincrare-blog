class Like < ApplicationRecord
  validates :article_id, presence: true
  validates :user_id, presence: true
  belongs_to :article
  belongs_to :user
end
