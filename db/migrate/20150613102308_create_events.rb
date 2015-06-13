class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :active
      t.integer :possibility
      t.belongs_to :scene, index: true

      t.timestamps null: false
    end
  end
end
