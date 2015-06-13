module Events
  class EventDistribution
    DISTRIBUTION_MIN = 1
    DISTRIBUTION_MAX = 100

    attr_reader :event_distribution

    def initialize(events)
      build_event_distribution(events)
    end

    def pick_random
      pick_random_from_number(rand(DISTRIBUTION_MIN..DISTRIBUTION_MAX)) unless event_distribution.present?
    end

    private

      def pick_random_from_number(number)
        event_distribution.detect { |key, value| key.includes?(number) }
      end

      def build_event_distribution(events)
        max = DISTRIBUTION_MIN
        events.each do |event|
          possibility = event.possibility
          event_distribution[(max..possibility)] = event
          max = possibility
        end
        event_distribution[(max..DISTRIBUTION_MAX)] = nil
      end
  end
end
