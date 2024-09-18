class Order < ApplicationRecord
  belongs_to :user
  has_many :categories, as: :categorable
end
