class ArticleAuthority < ApplicationRecord
  validates :article_id, presence: true
  validates :authority_id, presence: true
  belongs_to :article
  belongs_to :authority
end
