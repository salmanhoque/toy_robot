require 'spec_helper'

describe Action do
  let(:action) { described_class.new }

  context 'valid inputs' do
    it 'creats a new board' do
      state = action.input('board 7 7')
      expect(state.valid?).to be true
    end

    it 'places a robot on 0, 0, north' do
      expect(action.input('place 0 0 north').report).to eq 'Current Position: 0, 0, NORTH'
    end

    it 'places a robot on 0, 1, east' do
      expect(action.input('place 0 0 east').report).to eq 'Current Position: 0, 0, EAST'
    end

    it 'places a robot on 0, 1, SOUTH' do
      expect(action.input('PLACE 0 0 SOUTH').report).to eq 'Current Position: 0, 0, SOUTH'
    end
  end

  context 'invalid inputs' do
    it 'throws error if invalid params is passed to create board' do
      state = action.input('board -5 -5')
      expect(state.valid?).to be false
      expect(state.error).to eq 'Board size is not valid, only positive number accepted currently'
    end

    it 'throws error if placed in wrong possion' do
      expect_any_instance_of(Board).to receive(:valid_position?).and_return(false)

      state = action.input('place -1 5 north')
      expect(state.valid?).to be false
      expect(state.error).to eq 'Woops: you just drop that robot from the table!'
    end

    it 'throws error if direction is wrong possion' do
      state = action.input('place 1 5 north-east')
      expect(state.valid?).to be false
      expect(state.error).to eq 'Okay: valid directions are NORTH, EAST, SOUTH and WEST!'
    end

    it 'throws error if wrong command used' do
      state = action.input('dance')
      expect(state.valid?).to be false
      expect(state.error).to eq "Nope: can't do that, try 'help' for docs!"
    end
  end

  context 'move robot' do
    it 'moves robot 1 unit to east' do
      status = action.input('place 0, 0, east').input('move')
      expect(status.report).to eq 'Current Position: 1, 0, EAST'
    end

    it 'moves robot 2 units to east' do
      status = action.input('place 0, 0, east').input('move').input('move')
      expect(status.report).to eq 'Current Position: 2, 0, EAST'
    end

    it 'moves robot like jagger' do
      status = action
        .input('place 0, 0, east')
        .input('move')
        .input('move')
        .input('left')
        .input('move')
        .input('right')
        .input('move')
        .input('left')
        .input('left')

      expect(status.report).to eq 'Current Position: 3, 1, WEST'
    end
  end
end
