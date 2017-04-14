class ArticleAuthority < ApplicationRecord
  belongs_to :article
  belongs_to :authority
end
