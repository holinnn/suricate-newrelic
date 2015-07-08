module Suricate::Newrelic
  class Status
    def initialize(color)
      @color = color
    end

    def ok?
      @color == 'green'
    end

    def warning?
      @color == 'yellow'
    end

    def alert?
      @color == 'red'
    end
  end
end
