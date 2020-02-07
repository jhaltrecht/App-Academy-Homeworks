class Player
    attr_reader :name,:stack
    attr_accessor :hand,:active
    def initialize(name)
        @name=name
        @stack=500
        @active=true
    end

    def make_move(amount)
        move='z'
        until move=='f'||move=='c'||move=='r'
            puts "Do you wish to fold, call, or raise. 'f' to fold, 'c' to call,'r' to raise"
            move=gets.chomp
            break if move=='f'|| move=='c' || move=='r'
            puts "invalid action" unless move=='c' && move=='r' && move=='f'
        end
        fold if move=='f' 
        call(amount) if move=='c' 
         if move=='r' 
            puts "how much would you like to raise"
            raise_amount=gets.chomp.to_i
            raise(raise_amount+amount)
         end
    end

    def swap_move
         pos=0
        discard_count=0
        until pos=="s"
            puts " Enter a position of a card to discard: or 's' to skip "
            pos=gets.chomp.to_i
            break if pos=='s'
            pos=pos.to_i
            if pos.between?(0,4) 
                hand.discard(pos)
                discard_count+=1
            else raise "invalid position, try again:" 
            end
        end
        return discard_count
    end

    def call(amount)
        raise 'not enough money' if @stack-amount<0
        @stack-=amount
    end

    def raise(amount)
        raise 'not enough money to raise' if @stack-amount<0
        @stack-=amount
        return amount
    end

    def fold
        @active=false
    end

    def receive(winnings)
        @stack+=winnings
    end
end