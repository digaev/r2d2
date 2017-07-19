require_relative 'command'

module Robot
  class CommandMove < Command
    def execute
      @robot.move
    end
  end
end
