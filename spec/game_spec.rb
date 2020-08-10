require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe 'tictactoe' do
  let(:player1) { Player.new('Meltrust', 'X') }
  let(:player2) { Player.new('Charles', 'O') }
  let(:board) { Board.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 1, []) }

  describe '#print_board' do
    it 'returns the current game board' do
      expect(board.print_board).to eq(['[1  2  3]', '[4  5  6]', '[7  8  9]'])
    end
  end

  describe '#change_value' do
    it 'returns the updated board' do
      board.change_value(1, 'X')
      expect(board.print_board).to eql(['["X"  2  3]', '[4  5  6]', '[7  8  9]'])
    end
  end

  describe '#winning_diagonals_left' do
    it 'returns a test array to check winning in diagonals-left' do
      expect(board.winning_diagonals_left(0)).to eql([1, 5, 9])
    end
  end

  describe '#winning_diagonals_right' do
    it 'returns a test array to check winning in diagonals-right' do
      expect(board.winning_diagonals_right(2)).to eql([3, 5, 7])
    end
  end

  describe '#columns' do
    it 'returns a test array to check winning in first column' do
      expect(board.columns(0)).to eql([1, 4, 7])
    end

    it 'returns a test array to check winning in second column' do
      expect(board.columns(1)).to eql([2, 5, 8])
    end

    it 'returns a test array to check winning in third column' do
      expect(board.columns(2)).to eql([3, 6, 9])
    end
  end

  describe '# winning_rows' do
    it 'returns a test array to check winning in first row' do
      expect(board.winning_rows(0)).to eql([1, 2, 3])
    end

    it 'returns a test array to check winning in second row' do
      expect(board.winning_rows(1)).to eql([4, 5, 6])
    end

    it 'returns a test array to check winning in the third row' do
      expect(board.winning_rows(2)).to eql([7, 8, 9])
    end
  end

  describe '#create_xy_arr' do
    it 'returns a array containing the positions of the X' do
      expect(board.create_xy_arr('X')).to eql(%w[X X X])
    end

    it 'returns a array containing the positions of the O' do
      expect(board.create_xy_arr('O')).to eql(%w[O O O])
    end
  end

  describe '#decide_winner' do
    let(:zones) { [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]] }

    it 'returns \'win\' if columns method equals xy_arr' do
      # board.create_xy_arr('X')
      expect(board.create_xy_arr('X')).to eql(board.columns(0))
    end
  end
end

# == board.columns(0)).to be true
