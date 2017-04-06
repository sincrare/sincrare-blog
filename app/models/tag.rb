class Tag < ApplicationRecord
  validate :name, presence: true
  has_many :article_tags, dependent: :destroy
end
