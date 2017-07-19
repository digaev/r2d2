require_relative '../../../app/robot/command_right'

describe Robot::CommandRight do
  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::CommandRight.new(robot) }

    it 'executes command' do
      expect(robot).to receive(:right)

      subject.execute
    end
  end
end
