require_relative 'command'

module Robot
  class CommandLeft < Command
    def execute
      @robot.left
    end
  end
end
