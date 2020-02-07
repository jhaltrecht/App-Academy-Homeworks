# not finished moving on for now






















# require_relative "deck"
# require_relative "card"
# require_relative "player"
# require_relative "hand"
# class Game
#     attr_reader :deck,:players,:total,:pot
#     def initialize
#         @deck=Deck.new
#         @players=[]
#         @pot=0
#         playersTemp=@players.dup
#     end



#     def begin_game
#         add_players
#         until game_over?
#             amount=0
#             reset_players
#             deck_temp=@deck.shuffle!
#             newAmount=0
#                 @players.each do |player|
#                     next unless player.active
#                     puts "#{player.name}'s turn'"
#                     puts "Stack: #{player.stack} "
#                     player.hand=Hand.new(deck_temp.slice!(0,5))
#                     player.hand.render
#                     # find a loop to keep raises 
#                     # consider bool for raise or if amount is harder to track 
#                 amount=player.make_move(amount)
                
#             end
#             @players.each do |player|
#                 next unless player.active
#                 puts "#{player.name}'s turn'"
#                 puts "Stack: #{player.stack} "
#                 debugger
#                 player.hand.render
#                 count=player.swap_move
#                 count.times do 
#                     card=deck_temp.shift!
#                 end
#             end
#             amount=0
#             @players.each do |player|
#                 next unless player.active
#                  puts "#{player.name}'s turn'"
#                  puts "Stack: #{player.stack} "
#                  player.hand.render
#                  amount=player.make_move(amount)
#             end
#         end
#     end

#     def add_to_pot(num)
#         @pot+=num
#     end

#     def add_players
#         player_count=20 
#         puts "how many players do you want to have"
#         player_count=gets.chomp.to_i
#         raise "invalid amount of players" unless player_count.between?(2,8) 
#         player_count.times do 
#             puts "enter a name for the player"
#             player_name=gets.chomp
#             add_player(player_name)
#         end
#     end

#     def add_player(name)
#         @players<<Player.new(name)
#     end

#     def remove_player?
#         @players.each_with_index do |player,idx|
#             if player.stack==0
#                 puts "#{player_name(0)} is removed from the game"
#                 @players.slice!(idx)
#             end
#         end
#     end

#     def turn 
#         turn=@players[0]
#     end

#     def change_turn
#         @players.rotate!
#     end

#     def player_name(idx)
#         @players[idx].name
#     end

#     def game_over?
#         remove_player?
#         if @players.length==1
#             puts "#{@player[0]} wins" 
#             return true
#         end
#         false
#     end

#     def reset_players
#          @players.each do |player|
#                 player.active=true
#          end
#     end
# end


# if __FILE__ == $PROGRAM_NAME
#   Game.new.begin_game
# end