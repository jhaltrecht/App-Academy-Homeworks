require_relative "deck"
class Game
    attr_reader :deck,:players,:total,:pot
    def initialize
        @deck=Deck.new
        debugger
        @players=[]
        @total=10,000
        @pot=0
    end
end