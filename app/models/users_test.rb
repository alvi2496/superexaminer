class UsersTest < ApplicationRecord
  belongs_to :user, inverse_of: :users_tests
  belongs_to :test, inverse_of: :users_tests

  after_create :assign_accessor

  enum accessor: %i[teacher student]

  private

  def assign_accessor
    self.accessor = user.teacher? ? 'teacher' : 'student'
    save
  end
end
