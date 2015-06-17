module Events
  class EventAnswersDisplay
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    FIRST_ANSWER_POSITION_Y = 200
    ANSWER_GAP = 20

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
            link = event_answer_link(event_answer, position_y)
            position_y += ANSWER_GAP
            link
          end.join.html_safe
        end.html_safe
      end

      def event_answer_link(event_answer, position_y)
        event_answer.to_link(link_html_options) do
          content_tag(:div, class: [:bordered_box_black], style: "top: #{position_y}px; position: relative;") do
            event_answer.answer
          end
        end
      end

      def link_html_options
        {
          class: :event_answer_link,
          remote: true
        }
      end
  end
end
