class ArticleAuthority < ApplicationRecord
  validates :article_id, presence: true
  validates :authority_id, presence: true
end
