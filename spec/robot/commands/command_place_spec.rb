require_relative '../../../app/robot/command_place'

describe Robot::CommandPlace do
  describe '#execute' do
    let(:robot) { instance_double(Robot::Robot) }
    subject { Robot::CommandPlace.new(robot) }

    it 'executes command' do
      expect(robot).to receive(:place)

      subject.execute
    end
  end
end
