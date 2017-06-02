require 'spec_helper'

describe Robot do
  context 'Initilized with the valid params' do
    subject(:tom) { described_class.new(0, 0, 'EAST') }

    it 'It is a Robot instance' do
      expect(tom).to be_an_instance_of Robot
    end

    it 'Response to the arrtibutes' do
      expect(tom).to respond_to :x, :y, :f
    end

    it 'Able to report current state' do
      expect { tom.report }.to output("Output: 0,0,EAST\n").to_stdout
    end
  end

  context 'Initilized with the invalid params' do
    it 'Where x is negative' do
      expect { Robot.new(-1, 0, 'EAST') }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'Where y is negative' do
      expect { Robot.new(1, -1, 'EAST') }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'Where x and y is more than 5 unit' do
      expect { Robot.new(7, 5, 'EAST') }.to \
        output("Invalid Input\n").to_stdout
    end
  end

  describe 'public methods' do
    subject(:tom) { described_class.new(0, 4, 'NORTH') }

    context '#move' do
      it 'moves one unit to the NORTH' do
        tom.move
        expect { tom.report }.to output("Output: 0,5,NORTH\n").to_stdout
      end

      it 'throws errors when, it was told to move way too much' do
        # TODO: tom.move(2)
        tom.move
        expect { tom.move }.to output("Can not move further NORTH\n").to_stdout
      end
    end

    context '#rotate' do
      it 'rotates to LEFT and faces to WEST' do
        tom.rotate('LEFT')
        expect { tom.report }.to output("Output: 0,4,WEST\n").to_stdout
      end

      it 'rotates to RIGHT and faces to EAST' do
        tom.rotate('RIGHT')
        expect { tom.report }.to output("Output: 0,4,EAST\n").to_stdout
      end
    end
  end

  context 'test different move strategy' do
    subject(:tom) { described_class.new(0, 4, 'NORTH') }

    it 'moves one unit then turn Left and move one unit again' do
      tom.move
      tom.rotate('LEFT')
      expect { tom.move }.to output("Can not move further WEST\n").to_stdout
    end

    it 'moves one unit then turn Right and move one unit again' do
      tom.move
      tom.rotate('RIGHT')
      tom.move
      expect { tom.report }.to output("Output: 1,5,EAST\n").to_stdout
    end

    it 'moves one unit then turn Right twice and move one unit again' do
      tom.move
      tom.rotate('RIGHT')
      tom.rotate('RIGHT')
      tom.move
      expect { tom.report }.to output("Output: 0,4,SOUTH\n").to_stdout
    end
  end
end
