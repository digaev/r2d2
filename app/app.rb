#!/usr/bin/env ruby

require_relative 'robot/robot'

require_relative 'interpreter'
require_relative 'table'

class App
  attr_reader :controller
  attr_reader :robot
  attr_reader :table

  def initialize
    @controller = Robot::Controller.new
    @robot = Robot::Robot.new(-1, -1)
    @table = Table.new
  end

  def run(code)
    Interpreter.call(code) do |cmd|
      cmd = create_command(cmd)

      # - The application should discard all commands in the sequence
      #   until a valid `PLACE` command has been executed.
      # - A robot that is not on the table can choose the ignore the
      #  `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

      if cmd.is_a?(Robot::CommandPlace)
        @controller.execute(cmd)
        next
      end

      next unless @table.point_in_rect?(robot.x, robot.y)

      if cmd.is_a?(Robot::CommandMove)
        pos = robot.next_pos
        next unless table.point_in_rect?(pos[:x], pos[:y])
      end

      @controller.execute(cmd)
    end
  end

  private

  def create_command(cmd)
    case cmd.name
    when 'PLACE' then Robot::CommandPlace.new(
      @robot,
      x: cmd.args[0].to_i,
      y: cmd.args[1].to_i,
      direction: cmd.args[2].downcase.to_sym
    )
    when 'MOVE' then Robot::CommandMove.new(@robot)
    when 'LEFT' then Robot::CommandLeft.new(@robot)
    when 'RIGHT' then Robot::CommandRight.new(@robot)
    when 'REPORT' then Robot::CommandReport.new(@robot)
    else
      raise "Unknown command \"#{cmd[0]}\""
    end
  end
end

if ARGV.empty?
  puts 'Usage: app.rb FILENAME'
  puts 'Example: app.rb program.txt'
  exit
end

app = App.new
app.run(File.read(ARGV[0]))
