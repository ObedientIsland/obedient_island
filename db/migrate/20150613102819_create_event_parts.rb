class CreateEventParts < ActiveRecord::Migration
  def change
    create_table :event_parts do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.string :next_type, null: false
      t.integer :next_id, null: false
      t.attachment :image
      t.belongs_to :event, index: true

      t.timestamps null: false
    end
  end
end
