class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.belongs_to :test
      t.integer :number
      t.text :title
      t.string :mark
      t.timestamps
    end
  end
end
