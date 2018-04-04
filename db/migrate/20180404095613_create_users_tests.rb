class CreateUsersTests < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test, index: true
      t.integer :accessor, limit: 1
      t.timestamps
    end
  end
end
