require_relative '../../app/robot/robot'

describe Robot::Robot do
  describe '#new' do
    let(:direction) { Robot::Robot::DIRECTIONS.sample }

    it 'instaniates the Robot with given parameters' do
      robot = Robot::Robot.new(1, 2, direction)

      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq(direction)
    end
  end

  describe '#direction=' do
    subject { Robot::Robot.new }
    let(:direction) { Robot::Robot::DIRECTIONS.sample }

    context 'with invalid direction' do
      it 'raises error' do
        expect{ subject.direction = :foo }.to raise_error('Unknown direction "foo"')
      end
    end

    context 'with valid direction' do
      it 'sets robot direction' do
        subject.direction = direction

        expect(subject.direction).to eq(direction)
      end
    end
  end

  describe '#next_pos' do
    subject { Robot::Robot.new }

    it 'returns next position accodring to direction' do
      subject.direction = :north
      expect(subject.next_pos).to eq(x: 0, y: 1)

      subject.direction = :south
      expect(subject.next_pos).to eq(x: 0, y: -1)

      subject.direction = :east
      expect(subject.next_pos).to eq(x: 1, y: 0)

      subject.direction = :west
      expect(subject.next_pos).to eq(x: -1, y: 0)
    end
  end

  context 'Commands' do
    subject { Robot::Robot.new }

    before(:each) do
      subject.place(0, 0, :north)
    end

    describe '#place' do
      it 'places the robot in specified position and facing' do
        x = Faker::Number.between(1, 10)
        y = Faker::Number.between(1, 10)
        direction = Robot::Robot::DIRECTIONS.sample

        expect(subject).to receive(:direction=).with(direction)

        subject.place(x, y, direction)

        expect(subject.x).to eq(x)
        expect(subject.y).to eq(y)
      end
    end

    describe '#move' do
      it 'moves the robot' do
        expect(subject).to receive(:next_pos).and_return(x: 0, y: 1)

        subject.move

        expect(subject.x).to eq(0)
        expect(subject.y).to eq(1)
      end
    end

    describe '#left' do
      it 'rotates the robot counter-clockwise 90 degrees depending on direction' do
        subject.left
        expect(subject.direction).to eq(:west)

        subject.left
        expect(subject.direction).to eq(:south)

        subject.left
        expect(subject.direction).to eq(:east)

        subject.left
        expect(subject.direction).to eq(:north)
      end
    end

    describe '#right' do
      it 'rotates the robot clockwise 90 degrees depending on direction' do
        subject.right
        expect(subject.direction).to eq(:east)

        subject.right
        expect(subject.direction).to eq(:south)

        subject.right
        expect(subject.direction).to eq(:west)

        subject.right
        expect(subject.direction).to eq(:north)
      end
    end

    describe '#report' do
      it "prints robot's position and direction" do
        expect($stdout).to receive(:puts).with("#{subject.x},#{subject.y},#{subject.direction.to_s.upcase}")
        subject.report
      end
    end
  end
end
