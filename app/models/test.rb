class Test < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests
  has_many :questions, dependent: :destroy
end
