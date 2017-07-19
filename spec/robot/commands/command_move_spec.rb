require_relative '../../../app/robot/command_move'

describe Robot::CommandMove do
  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::CommandMove.new(robot) }

    it 'executes command' do
      expect(robot).to receive(:move)

      subject.execute
    end
  end
end
