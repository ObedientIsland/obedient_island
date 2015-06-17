module Events
  class EventTextDisplay
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    attr_reader :event

    def initialize(event)
      @event = event
    end

    def call
      content_tag(:div, class: [:event_part_text_box, :bordered_box_black]) do
        content_tag(:h2, event.title, class: :text_box_title) +
        content_tag(:div, event.text, class: :text_box_text_area)
      end
    end
  end
end
