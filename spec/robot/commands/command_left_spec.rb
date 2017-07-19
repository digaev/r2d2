require_relative '../../../app/robot/command_left'

describe Robot::CommandLeft do
  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::CommandLeft.new(robot) }

    it 'executes command' do
      expect(robot).to receive(:left)

      subject.execute
    end
  end
end

