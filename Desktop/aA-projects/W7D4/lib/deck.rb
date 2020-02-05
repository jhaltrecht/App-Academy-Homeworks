class Deck
    CARD_FACES=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    SUITS=["♠","♥","♣","♦"]
    attr_reader :cards
    def initialize
        @cards=[]
        add_cards_to_deck
    end

    def add_cards_to_deck
        CARD_FACES.each do |card_face|
            SUITS.each do |suit|
                @cards<<Card.new(card_face,suit)
            end
        end
    end

    def shuffle!
        @cards.shuffle!
    end

end