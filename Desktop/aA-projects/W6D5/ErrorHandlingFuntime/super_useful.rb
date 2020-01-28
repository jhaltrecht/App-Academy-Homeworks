# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "Cannot convert to Integer. Please ensure you pass a valid numeric string"
  ensure
    num ||= 0
  end
  num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit=="coffee" || "Coffee"
    raise CoffeError 
  else raise NotAFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  
  reaction(maybe_fruit) 
  
  rescue CoffeError=>cof
    puts cof.message
    retry
  rescue NotAFruitError=>naf
    puts naf.message
  end
end  

class CoffeError<StandardError
  def message
    puts "Too much caffeine. Try something else"
  end
end

class NotAFruitError<StandardError
  def message
    puts "This is not one of my fruits"
  end
end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
     raise ArgumentError.new("not enough years known") if yrs_known<5
    raise ArgumentError.new("please enter a name") if name.length<=0
    raise ArgumentError.new("please enter a favorite pastime") if fav_pastime.length<=0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
   
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


