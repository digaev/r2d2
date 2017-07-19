require_relative 'command'

module Robot
  class CommandPlace < Command
    def execute
      @robot.place(@args[:x], @args[:y], @args[:direction])
    end
  end
end
