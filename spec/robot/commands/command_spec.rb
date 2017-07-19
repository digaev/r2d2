require_relative '../../../app/robot/robot'

describe Robot::Command do
  describe '#new' do
    let(:robot) { instance_double(Robot::Robot) }

    it 'instantiates command' do
      command = Robot::Command.new(robot)

      expect(command.robot).to eq(robot)
      expect(command.args).to eq({})
    end
  end

  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::Command.new(robot) }

    it 'raises NotImplementedError' do
      expect{ subject.execute }.to raise_error(NotImplementedError)
    end
  end
end
