require 'spec_helper'

describe Board do
  context 'initialization' do
    context 'with valid params' do
      it 'validates valid board size' do
        board = described_class.new(5, 5)
        expect(board.valid?).to eq true
      end
    end

    context 'with invalid params' do
      it 'tries to initialize' do
        expect {
          described_class.new(-5, -5)
        }.to raise_error('Board size is not valid, only positive number accepted currently')
      end
    end
  end

  context '#valid_position?' do
    it 'validates position on the board' do
      board = described_class.new(5, 5)
      expect(board.valid_position?(5, 5)).to eq true
    end

    it 'validates invalid position on the board' do
      board = described_class.new(5, 5)
      expect(board.valid_position?(0, 6)).to eq false
    end

    it 'validates negative position on the board' do
      board = described_class.new(5, 5)
      expect(board.valid_position?(-1, 0)).to eq false
    end
  end
end
