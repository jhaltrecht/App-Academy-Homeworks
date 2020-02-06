class Card
    CARD_FACES=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    SUITS=["♠","♥","♣","♦"]
    attr_reader :value,:suit,:rank
    def initialize(value,suit)
        raise "invalid suit" unless SUITS.include?(suit)
        raise "invalid face value" unless CARD_FACES.include?(value)
        @value=value
        @rank=to_rank
        @suit=suit
    end

    def to_rank
        if @value=="J"||@value=="Q"||@value=="K"||@value=="A" 
            @rank=11 if @value=="J"
            @rank=12 if @value=="Q"
            @rank=13 if @value=="K"
            @rank=14 if @value=="A"
        else @rank=@value.to_i
        end
        @rank
    end

    def inspect
        @value
    end

end
