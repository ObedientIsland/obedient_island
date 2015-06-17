class CreateEventAnswers < ActiveRecord::Migration
  def change
    create_table :event_answers do |t|
      t.string :name, null: false
      t.string :answer, null: false
      t.string :next_type, null: false
      t.integer :next_id, null: false
      t.belongs_to :event_part, index: true

      t.timestamps null: false
    end
  end
end
