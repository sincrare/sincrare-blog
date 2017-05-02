class Article < ApplicationRecord
  validates :title, presence: true
  validates :entry_at, presence: true
  has_many :comments, dependent: :destroy
  has_many :article_authorities
  has_many :authorities, :through => :article_authorities
  has_many :article_tags
  has_many :tags, :through => :article_tags
  has_many :likes, dependent: :destroy

  scope :user_accessible, ->(authority_id) { includes(:authorities).where(authorities: {id: authority_id}, is_draft: false) }
  scope :order_by_descending, -> { order(entry_at: :desc) }
end
