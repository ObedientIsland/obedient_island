class CreateEventParts < ActiveRecord::Migration
  def change
    create_table :event_parts do |t|
      t.string :title
      t.text :text
      t.string :next_type
      t.integer :next_id
      t.attachment :image
      t.belongs_to :event, index: true

      t.timestamps null: false
    end
  end
end
