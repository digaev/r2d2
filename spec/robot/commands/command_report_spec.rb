require_relative '../../../app/robot/command_report'

describe Robot::CommandReport do
  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::CommandReport.new(robot) }

    it 'executes command' do
      expect(robot).to receive(:report)

      subject.execute
    end
  end
end
