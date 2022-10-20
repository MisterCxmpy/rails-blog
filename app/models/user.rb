class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case-sensitive: false }, length: { minimum: 3, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case-sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX}
end