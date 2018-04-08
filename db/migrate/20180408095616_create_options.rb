class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.belongs_to :question
      t.integer :number
      t.string :title
      t.boolean :is_answer, default: false
      t.timestamps
    end
  end
end
