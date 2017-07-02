require 'spec_helper'

describe Robot do
  context 'Initilized with' do
    let(:board) { double('Board') }

    context 'valid valid params' do
      subject(:tom) { described_class.new(board, 0, 0, 'east') }

      it 'is a Robot instance' do
        expect(tom).to be_an_instance_of Robot
      end

      it 'ables to report current state' do
        expect(tom.report).to eq('Current Position: 0, 0, EAST')
      end
    end

    context 'invalid params' do
      it 'throws error when intialized with wrong params' do
        expect {
          described_class.new(board, 0, 0, 'north-east')
        }.to raise_error('Okay: valid directions are NORTH, EAST, SOUTH and WEST!')
      end
    end
  end

  describe 'public methods' do
    let(:board) { Board.new(5, 5) }

    context '#move' do
      context 'vaild moves' do
        it 'moves one unit to the NORTH' do
          tom = described_class.new(board, 0, 4, 'north')
          tom.move
          expect(tom.report).to eq('Current Position: 0, 5, NORTH')
        end
      end

      context 'invalid moves' do
        it 'throws errors when, it was told to move way too much north' do
          tom = described_class.new(board, 0, 5, 'north')
          expect { tom.move }.to raise_error('Can not move further NORTH')

          # check current possion after error message
          expect(tom.report).to eq('Current Position: 0, 5, NORTH')
        end

        it 'throws errors when, it was told to move way too much south' do
          tom = described_class.new(board, 0, 0, 'south')
          expect { tom.move }.to raise_error('Can not move further SOUTH')
        end

        it 'throws errors when, it was told to move way too much east' do
          tom = described_class.new(board, 5, 0, 'east')
          expect { tom.move }.to raise_error('Can not move further EAST')
        end

        it 'throws errors when, it was told to move way too much west' do
          tom = described_class.new(board, 0, 0, 'west')
          expect { tom.move }.to raise_error('Can not move further WEST')
        end
      end
    end

    context '#rotate' do
      it 'rotates from NORTH to clockwise' do
        tom = described_class.new(board, 0, 5, 'north')

        tom.rotate_right
        expect(tom.report).to eq('Current Position: 0, 5, EAST')

        tom.rotate_right
        expect(tom.report).to eq('Current Position: 0, 5, SOUTH')

        tom.rotate_right
        expect(tom.report).to eq('Current Position: 0, 5, WEST')

        tom.rotate_right
        expect(tom.report).to eq('Current Position: 0, 5, NORTH')
      end

      it 'rotates from NORTH to anticlockwise' do
        tom = described_class.new(board, 0, 5, 'north')

        tom.rotate_left
        expect(tom.report).to eq('Current Position: 0, 5, WEST')

        tom.rotate_left
        expect(tom.report).to eq('Current Position: 0, 5, SOUTH')

        tom.rotate_left
        expect(tom.report).to eq('Current Position: 0, 5, EAST')

        tom.rotate_left
        expect(tom.report).to eq('Current Position: 0, 5, NORTH')
      end
    end
  end
end
