class User < ActiveRecord::Base
    has_many :scorecards
    has_secure_password
    

    validates :username, :name, presence: true
    validates :username, uniqueness: true
end