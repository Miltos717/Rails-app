class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum: 3,maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum: 5,maximum: 25},format: {with: VALID_EMAIL_REGEX}



end
