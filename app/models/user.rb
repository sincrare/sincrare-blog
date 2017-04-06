class User < ApplicationRecord
  validates :name, presence: true
  validates :authority_id, presence: true
  has_many :like, dependent: :destroy
  has_many :access_histories, dependent: :destroy
  belongs_to :authority
end
