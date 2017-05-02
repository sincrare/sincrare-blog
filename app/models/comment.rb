class Comment < ApplicationRecord
  validates :article_id, presence: true
  validates :entry_user_id, presence: true
  belongs_to :article
  belongs_to :user, foreign_key: 'entry_user_id'

  scope :user_accessible, ->(authority_id) { includes(article: :authorities).order(created_at: :desc).where(authorities: {id: authority_id}) }
end
