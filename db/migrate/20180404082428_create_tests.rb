class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :test_name
      t.string :course_code
      t.string :course_name
      t.integer :full_mark
      t.date :date
      t.time :start_time
      t.integer :duration
      t.text :syllabus
      t.timestamps
    end
  end
end
