class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: true
    validates :username, length: { minimum: 5 }
    validates :password, length: { minimum: 5 }
    validates :password_confirmation, presence: true
end
