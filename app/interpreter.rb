class Parser
  def self.call(code)
    command = Struct.new(:name, :args)

    code.split("\n").map do |expression|
      expression.strip!
      next if expression.empty?

      cmd = expression.split(' ')
      args = cmd.length > 1 ? cmd[1..-1].join.split(',') : []

      yield command.new(cmd[0], args)
    end
  end
end

class Interpreter
  def self.call(code)
    Parser.call(code) { |command| yield command }
  end
end
