class Player
    attr_reader :name,:hand
    def initialize(name)
        @name=name
        @stack=500
    end

    def make_move
        move='z'
        unless move=='f'||move=='c'||move=='r'
            puts "Do you wish to fold, call, or raise. 'f' to fold, 'c' to call,'r' to raise"
            move=gets.chomp
            break if move=='f'|| break if move=='c' || break if move=='r'
            puts "invalid action" unless move=='c' && move=='r' && move=='f'
        end
        fold if move=='f' 
        call if move=='c' 
        raise if move=='r' 
    end

    def swap_move
         pos=0
        discard_count=0
        unless pos=="s"
            puts " Enter a position of a card to discard: or 's' to skip "
            break if pos=='s'
            pos=pos.to_i
            if pos.between?(0,4) 
                hand.discard(pos)
                discard_count+=1
            else puts "invalid position, try again:" 
            end
        end
        return discard_count
    end

    def call(amount)
        @stack-amount
    end

    def raise(amount)
        puts "how much would you like to raise?"
        raise_amount=gets.input.map(&:to_i)
        return 
    end

    def fold

    end
end