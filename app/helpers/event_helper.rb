module EventHelper

  def link_to_event(name, id)
    link_to(event_path(id)) do
      "#{name}(Id: #{id})"
    end
  end

end