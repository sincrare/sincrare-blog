class User < ApplicationRecord
  validates :name, presence: true
  validates :authority_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :access_histories, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :authority
end
