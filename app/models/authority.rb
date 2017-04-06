class Authority < ApplicationRecord
  validate :name, presence: true
  has_many :article_authorities, dependent: :destroy
  has_many :users, dependent: :destroy
  belongs_to :article
  belongs_to :authority
end
