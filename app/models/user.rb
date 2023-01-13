class User < ApplicationRecord
    has_secure_password

    has_many :consultation

    validates :username, presence: true

end
