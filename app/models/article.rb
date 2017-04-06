class Article < ApplicationRecord
  validates :title, presence: true
  validates :entry_at, presence: true
  has_many :comments, dependent: :destroy
  has_many :article_authorities, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :likes, dependent: :destroy
end
