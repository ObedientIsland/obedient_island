module Events
  class EventAnswersDisplay
    include Rails.application.routes.url_helpers
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    FIRST_ANSWER_POSITION_Y = 400
    ANSWER_GAP = 50

    attr_reader :event_answers

    def initialize(event_answers)
      @event_answers = event_answers
    end

    def call
      event_answers.present? ? event_answer_box : ''
    end

    private

      def event_answer_box
        content_tag(:div, class: :event_answer_box) do
          position_y = FIRST_ANSWER_POSITION_Y
          event_answers.collect do |event_answer|
            event_answer_link(event_answer, position_y)
            position_y += ANSWER_GAP
          end.join.html_safe
        end
      end

      def event_answer_link(event_answer, position_y)
        link_to(event_answer.answer,
                link_path(event_answer),
                link_html_options(position_y))
      end

      def link_html_options(position_y)
        {
          class: :event_answer_link,
          style: "top: #{position_y}px;"
        }
      end

      def link_path(event_answer)
        {
          action: event_answer.next_type,
          controller: :application_controller,
          "#{event_answer.next_type}_id": event_answer.next_id,
          remote: true
        }
      end
  end
end
