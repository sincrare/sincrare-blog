class Comment < ApplicationRecord
  validates :article_id, presence: true
  validates :entry_user_id, presence: true
  belongs_to :article
  belongs_to :user, foreign_key: 'entry_user_id'
end
