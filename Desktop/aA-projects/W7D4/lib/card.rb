class Card
    CARD_FACES=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    SUITS=["♠","♥","♣","♦"]
    attr_reader :value,:suit
    def initialize(value,suit)
        raise "invalid suit" unless SUITS.include?(suit)
        raise "invalid face value" unless CARD_FACES.include?(value)
        @value=value
        @suit=suit
    end
end
