class User < ApplicationRecord
  before_save :email.downcase
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,length: {maximum: Settings.max_length_email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :name,  presence: true, length: { maximum: Settings.max_length_name}
  validates :password, presence: true, length: { minimum: Settings.min_length_pass}

  has_secure_password
end
