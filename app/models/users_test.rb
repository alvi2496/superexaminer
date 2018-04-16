class UsersTest < ApplicationRecord
  belongs_to :user, inverse_of: :users_tests
  belongs_to :test, inverse_of: :users_tests

  after_create :assign_accessor

  enum accessor: %i[teacher student]

  scope :users_test, -> (user_id, test_id) { where('user_id = ? AND test_id = ?', user_id, test_id) }

  private

  def assign_accessor
    self.accessor = user.teacher? ? 'teacher' : 'student'
    save
  end
end
