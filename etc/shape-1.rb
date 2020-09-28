class Game
  # self = Game
  @games = [1,2,3]

  # def self.games
  #   @games
  # end

  class << self
  end

  def self.next_id
    @games.length + 1
  end

  def self.each
    @games.each { |game| yield game }
  end

  def self.map
    @games.map { |game| yield game }
  end

  def self.find

  def initialize
    # self = an instance of Game
    @games = 'foo'
  end

  def games
    @games
  end

  def save
    # self = a dirty object instance of Game
    self.class.save(self)
  end

  def self.save(game)
    game.id = next_id
    @games << game
  end
end

# game = Game.new
# puts Game.games
# puts game.games

Game.each { |game| puts game }

def method
  puts yield(1)
end

method() do |x|
  "hello world"
end
