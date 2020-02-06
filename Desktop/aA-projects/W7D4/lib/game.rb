require_relative "deck"
require_relative "player"
class Game
    attr_reader :deck,:players,:total,:pot
    def initialize
        @deck=Deck.new
        @players=[]
        @total=10,000
        @pot=0
    end

    def add_to_pot(num)
        @pot+=num
    end

    def add_player(name)
        @players<<Player.new(name)
    end

    def player_name(idx)
        @players[idx].name
    end
end