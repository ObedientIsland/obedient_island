module EventPartHelper

  def link_to_event_part(name, id)
    link_to(event_path(id)) do
      "#{name}(Id: #{id})"
    end
  end

end