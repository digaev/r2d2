require_relative '../../app/robot/command'
require_relative '../../app/robot/controller'

describe Robot::Controller do
  describe '#execute' do
    subject { Robot::Controller.new }
    let(:command) { instance_double(Robot::Command) }

    it 'executes command' do
      expect(command).to receive(:execute)

      subject.execute(command)
    end
  end
end
