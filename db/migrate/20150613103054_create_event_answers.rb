class CreateEventAnswers < ActiveRecord::Migration
  def change
    create_table :event_answers do |t|
      t.string :answer
      t.string :next_type
      t.integer :next_id
      t.belongs_to :event_part, index: true

      t.timestamps null: false
    end
  end
end
