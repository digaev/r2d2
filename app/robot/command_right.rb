require_relative 'command'

module Robot
  class CommandRight < Command
    def execute
      @robot.right
    end
  end
end
