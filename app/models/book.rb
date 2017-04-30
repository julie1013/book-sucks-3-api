class Book < ActiveRecord::Base
  has_many :reads
  has_many :lists, through: :reads
  has_many :reviews
end
