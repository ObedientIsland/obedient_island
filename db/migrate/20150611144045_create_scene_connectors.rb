class CreateSceneConnectors < ActiveRecord::Migration
  def change
    create_table :scene_connectors, force: true do |t|
      t.integer :position_x, null: false
      t.integer :position_y, null: false
      t.integer :scene_from_id, null: false
      t.integer :scene_to_id, null: false
    end
  end
end
