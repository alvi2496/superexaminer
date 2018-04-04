class UsersTest < ApplicationRecord
  belongs_to :user, inverse_of: :users_tests
  belongs_to :test, inverse_of: :users_tests
end
