class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name, null: false
      t.string :title, null: false
    end
  end
end
