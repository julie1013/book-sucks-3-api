class List < ActiveRecord::Base
  belongs_to :user
  has_many :reads
  has_many :books, through: :reads
end
