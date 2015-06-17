module SceneHelper

  def link_to_scene(name, id)
    link_to(scene_path(id)) do
      "#{name}(Id: #{id})"
    end
  end

end