class User < ActiveRecord::Base
  has_secure_password
  has_one :list
  has_many :reviews
end
