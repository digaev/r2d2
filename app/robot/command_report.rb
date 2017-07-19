require_relative 'command'

module Robot
  class CommandReport < Command
    def execute
      @robot.report
    end
  end
end
