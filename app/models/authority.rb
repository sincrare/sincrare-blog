class Authority < ApplicationRecord
  validates :name, presence: true
  has_many :article_authorities, dependent: :destroy
  has_many :users, dependent: :destroy
end
