module Events
  class EventChecker
    MAX_POSSIBILTY = 100
    MIN_POSSIBILTY = 0

    attr_reader :events

    def initialize(scene)
      @events = scene.events.where(active: true)
    end

    # Returns nil of no event was triggered or the scene has no events
    def call
      catch_event unless no_event_possible?
    end

    private

      def catch_event
        enfored_event? ? enfore_most_possible_event : catch_random_event
      end

      def enfore_most_possible_event
        events.max_by(&:possibility)
      end

      def catch_random_event
        EventDistribution.new(events).pick_random
      end

      def sum_of_possibilities
        @sum_of_possibilities ||= events.reduce(0) { |sum, event| sum + event.possibility }
      end

      def no_event_possible?
        sum_of_possibilities == MIN_POSSIBILTY
      end

      def enfored_event?
        sum_of_possibilities >= MAX_POSSIBILTY
      end

  end
end
