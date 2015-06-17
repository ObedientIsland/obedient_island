class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.boolean :active, default: false
      t.integer :possibility, default: 0
      t.belongs_to :scene, index: true

      t.timestamps null: false
    end
  end
end
