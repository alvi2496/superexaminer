class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.integer :correct_option_id
      t.integer :given_option_id
      t.float :correctness
      t.float :gained_mark
      t.timestamps
    end
  end
end
