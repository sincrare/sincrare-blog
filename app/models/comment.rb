class Comment < ApplicationRecord
  validates :article_id, presence: true
  validates :entry_user_id, presence: true
  belongs_to :article
end
