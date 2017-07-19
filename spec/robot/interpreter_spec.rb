require_relative '../../app/interpreter'

describe Parser do
  describe '#call' do
    let(:code) { "PLACE 0,0,EAST\nMOVE\nMOVE\nLEFT\nMOVE\nRIGHT\nREPORT" }
    let(:program) do
      command = Struct.new(:name, :args)

      [
        command.new('PLACE', %w[0 0 EAST]),
        command.new('MOVE', []),
        command.new('MOVE', []),
        command.new('LEFT', []),
        command.new('MOVE', []),
        command.new('RIGHT', []),
        command.new('REPORT', []),
      ].freeze
    end

    it 'parses code' do
      i = 0
      Parser.call(code) do |command|
        expect(command.name).to eq(program[i].name)
        expect(command.args).to eq(program[i].args)

        i += 1
      end
    end
  end
end

describe Interpreter do
  describe '#call' do
    it 'interpret the code' do
      expect(Parser).to receive(:call).with('foo')

      Interpreter.call('foo')
    end
  end
end
