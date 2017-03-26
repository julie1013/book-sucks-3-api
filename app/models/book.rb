class Book < ActiveRecord::Base
  has_many :reads
  has_many :lists, through: :reads
end
