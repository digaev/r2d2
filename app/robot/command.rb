module Robot
  class Command
    attr_reader :robot
    attr_reader :args

    def initialize(robot, **args)
      @robot = robot
      @args = args.freeze
    end

    def execute
      raise NotImplementedError
    end
  end
end
