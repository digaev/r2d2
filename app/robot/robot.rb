require_relative 'command_left'
require_relative 'command_move'
require_relative 'command_place'
require_relative 'command_report'
require_relative 'command_right'
require_relative 'controller'

module Robot
  class Robot
    DIRECTIONS = %i[north south east west].freeze

    attr_reader :x
    attr_reader :y
    attr_reader :direction

    def initialize(x = 0, y = 0, direction = nil)
      place(x, y, direction || DIRECTIONS.sample)
    end

    def direction=(value)
      raise "Unknown direction \"#{value}\"" unless DIRECTIONS.include?(value)

      @direction = value
    end

    def next_pos
      x = @x
      y = @y

      case @direction
      when :north then y = @y + 1
      when :south then y = @y - 1
      when :east then x = @x + 1
      when :west then x = @x - 1
      end

      { x: x, y: y }
    end

    def place(x, y, direction)
      @x = x
      @y = y
      self.direction = direction
    end

    def move
      pos = next_pos
      @x = pos[:x]
      @y = pos[:y]
    end

    def left
      case @direction
      when :north then @direction = :west
      when :south then @direction = :east
      when :east then @direction = :north
      when :west then @direction = :south
      end
    end

    def right
      case @direction
      when :north then @direction = :east
      when :south then @direction = :west
      when :east then @direction = :south
      when :west then @direction = :north
      end
    end

    def report
      puts "#{@x},#{@y},#{@direction.to_s.upcase}"
    end
  end
end
