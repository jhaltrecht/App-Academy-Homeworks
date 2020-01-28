class Tile 

    require 'colorize'
attr_accessor :value,:showValue,:revealed
    def initialize()
        @flagged=false
        @revealed=false
        @value="*"
        @showValue="*"
    end

    def to_s
        @revealed==false ? @showValue : @value
    end

    def flag
        @flagged=!@flagged
        flagReveal
    end

    def flagReveal
        if @revealed==false && @flagged ==true 
            @showValue="F".colorize(:red) 
        else @showValue="*"
        end
    end

    def reveal(bombCount)
        if @revealed==false && @value!="B" && @showValue!="F".colorize(:red) 
            @revealed=true
            if bombCount==0
                @value="_".colorize(:green)
            else @value=bombCount.to_s
            end
            # @showValue=@value
        end
            
    end

    # def inspect
    #     arr=[@showValue.inspect, @value.inspect, @revealed.inspect, @flagged.inspect]
    #     arr 
    # end


    




    #         elsif @bombed==true
    #             @showValue="BOMB"
    #             # do end game function
    #         end
    #     else @revealed=true
    #         reveal neighbors if neighbors are not bombs
    #     end
            
    # end, #neighbors, #neighbor_bomb_count

end


# flag being overwritten 