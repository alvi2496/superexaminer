class AddColumnIsTakenToUsersTest < ActiveRecord::Migration[5.1]
  def change
    add_column :users_tests, :is_taken, :boolean, default: false
  end
end
