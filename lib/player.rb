class Player
  attr_reader :symbol, :name
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end
end
