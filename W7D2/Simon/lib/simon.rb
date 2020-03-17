class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length=1
    @game_over=false
    @seq=[]
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
    round_success_message
    @sequence_length+=1
    end
    
  end

  def show_sequence
    add_random_color
    puts "#{seq.join(" ")}"
  end

  def require_sequence
    puts "repeat back the new sequence:"
    seq.each do |color|
      userGuess=gets.chomp
      if userGuess.downcase!=color
        @game_over=true
      end
    end
  end

  def add_random_color
    randColor=COLORS.sample
    seq<<randColor
  end

  def round_success_message
    puts "You're still alive, good luck!"
  end

  def game_over_message
    puts "Sorry, you lost!"
  end

  def reset_game
    @sequence_length=1
    @game_over=false
    @seq=[]
  end
end
