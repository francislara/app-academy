class CoffeeError < StandardError
end

# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue TypeError => e
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise CoffeeError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    puts "that's not a fruit... but ill give you another chance if you
    give me coffee"

    maybe_coffee = gets.chomp
    if maybe_coffee == "coffee"
      retry
    else
      puts "that's not coffee"
    end
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise "WHAT KIND OF QUALIFICATIONS DO YOU HAVE FOR THIS TITLE" if name.empty?
    @yrs_known = yrs_known
    raise "That's DEFINITELY not a BEST friend...maybe a homie...." if @yrs_known < 5
    @fav_pastime = fav_pastime
    raise "Let's rethink our titles...." if fav_pastime.empty?
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
