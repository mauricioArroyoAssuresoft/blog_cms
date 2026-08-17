class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many(:posts, dependent: :nullify)
  has_many(:comments, dependent: :destroy)
end
