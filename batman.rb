
#global' variables
var = ["a","b","c"]
exit = false

# you_die method kills the character when too many wrong inputs
def you_die
  print `clear`
  puts "The door opens behind you."
  puts "The last thing you see is the Joker's gun's barrel in your face."
  puts "BANG!! everything goes silent..."
  puts "The End"
  print `afplay /Users/Marce/Desktop/BckUppy/WebDeveloping/rubymedia/joker_evil_laugh.mp3 &`
  sleep(4)
  exit
end

# reach_the_exit Method ends the game successfuly
def reach_the_exit
puts "You reach the exit and notice something familiar..."
puts " You are safe now..."
sleep(1)
puts """
        `MMMMMMMMMMMMMMMMMMMMM.                               MMMMMMMMMMMMMMMMMMMMM'
           `MMMMMMMMMMMMMMMMMMMM           AA  AA           MMMMMMMMMMMMMMMMMMMM'
             `MMMMMMMMMMMMMMMMMMM          MMMMMM          MMMMMMMMMMMMMMMMMMM'
               MMMMMMMMMMMMMMMMMMM-_______MMMMMMMM_______-MMMMMMMMMMMMMMMMMMM
                MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
             .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.
                             `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                                    `MMMMMMMMMMMMMMMMMM'
                                       `MMMMMMMMMM'
                                          MMMMMM
                                           MMMM
                                            MM """
print `afplay /Users/Marce/Desktop/BckUppy/WebDeveloping/rubymedia/batman_theme.mp3`
end

def riddles
	riddle1 = ["\n\t\"What is the beginning of eternity,\n\t\tthe end of time and space,\n\t\t\tthe beginning of every end\n\t\t\t\tand the end of every race?\"\n\n", {answer: "The letter E", hint: "\n(Here is a little hint: Look at each letter)\n(You better hurry, sounds like the mob in the hallway is coming your way)"}]
	riddle2 = ["\n\t\"You can have me but cannot hold me;\n\t  Gain me and quickly lose me.\n\t    If treated with care I can be great,\n\t      And if betrayed I will break.\n\t        What am I?",{answer: "trust", hint: "\n(hint: It's part of being an AWESOME team member)"}]
	riddle3 = ["\n\tWhat can run but never walks,\n\t  What has a mouth but never talks,\n\t    Has a bed but never sleeps,\n\t      Has a head, but never weeps?", {answer: "A River", hint: "(Hint: Billy Joel had one made of dreams...)"}]
	riddles = [riddle1, riddle2, riddle3]
	riddles
end

def enter_stairs(tries,strikes, riddle_for_this_round)
  #randomizer = rand(riddles.length)
  case tries
  when 0
    if strikes == 0
      print `clear`
      print "\nOh no! The riddler is clubbing another inmate to death as yoou walk in.\nAlmost undisturbed he looks at you and says: "
    end
    puts riddles[riddle_for_this_round][0]
    case strikes
    when 0
      print "\nStill holding the bleeding inmate, he grins at you waiting for ananswer\nBetter give it a try! :\n"
    when 1
      puts riddles[riddle_for_this_round][1][:hint]
    when 2
      print "\nYour last chance: \n"
    end
    answ = gets.chomp
    print "\n(You better hurry, sounds like the mob in the hallway is coming your way)\nPress Enter to continue."
    if riddles[riddle_for_this_round][1][:answer].downcase.include? answ.downcase
      enter_stairs(2,0, riddle_for_this_round)
    else
      case strikes
      when 0
        print `clear`
        enter_stairs(1,1, riddle_for_this_round)
      when 1
        print `clear`
        enter_stairs(0,2, riddle_for_this_round)
      when 2
        you_die
      end
      enter_stairs(1,1, riddle_for_this_round)
    end
  when 1
    print `clear`
    puts "The Riddler cringes at your answer, but is otherwise entertained bashing the inmate"
    enter_stairs(0,1, riddle_for_this_round)
  when 2
    print `clear`
    puts "\"MARVELOUS!\" yelps the Riddler. \"Such brilliant mind should have no problen finding the exit. \nIt's a madhouse in here, I tell you\""
    reach_the_exit
  end
end

def coin_flip
  puts`clear`
  puts "You watch helpless as the coin flips trough the air"
  coin = rand(2)
  print "Press Enter to continue."
  gets
  if coin == 1
    print "\nHeads!! Twoface fixes his jacked, pats you in the shoulder and walks away.\nYou lucked out. Better rush to the exit stairs!\nPress Enter to continue."
    gets
    enter_stairs(0,0)
  else
    print "\nTAILS!\nTwoface puts away his coin\n\"Maybe I'll leave this one for you...\" He tells someone behind you\nPress Enter to continue."
    gets
    you_die
  end
 end

# enter_restroom module gives user action options in side restroom
def enter_restroom(strikes)
  if strikes == 0
    puts`clear`
    print "As if your day couldn't get any worse...\nHarvey Dent himself a.k.a. \"Twoface\" walks out of a stall.\n\"My, my...\" He says. \"Isn't it our lucky day? Or maybe just mine?\n\"Lets leave it to chance. Heads I'll be om my way, Tails YOU're IN my way...\""
  end
  if strikes == 2
    you_die
  end
  print "\na) You hesitantly agree\nb) You run back out!\n"
  answ = gets.chomp.downcase
  case answ
  when "a"
    coin_flip
  when "b"
    puts`clear`
    print "You get the hell out of there and run to the exit stairs, almost ignoring the mob of crazy, violent inmates flooding the hallways"
    enter_stairs(0,0,rand(riddles.length))
  else
    scold
    enter_restroom(strikes+1)
  end
end

def scold
  print "\nThis is no time for foolish answers!\n"
end

# hallway Method gives user action options once in the hallway
def hallway(strikes)
  print `clear`
  if strikes == 3
    you_die
    exit
  end
  print "\nYou get to the hallway and carefully walk to the exit.\nSounds of riot approach behind you...\na) You run as fast as you can to the exit stairs door.\nb) Enter a security office and try to hide in the restroom.\n"
  answ = gets.chomp.downcase
  case answ
  when "a"
    print `clear`
    enter_stairs(0,0,rand(riddles.length))
  when "b"
    enter_restroom(0)
  else
    scold
    hallway(strikes + 1)
  end
end

# wake_up Method gives a list of actions as the game starts and executes them according to user input until all actions have been done or a 'key-one' is selected
def wake_up(i)
  print `clear`
  puts "The back up generator alarm wakes you up. Your ears are buzzing"
  puts "You're on the floor of what appears to be a guards post. It looks like there was an explosion."
  puts "Blood dripping from your head"
  puts "You look around and you: "
  puts "a) head for the door"
  if i.include?("b")
    puts "b) look for a phone"
  end
  if i.include?("c")
    puts "c) look at the security screens"
  end
  answ = gets.chomp.downcase
  case answ
  when "a"
    puts "Yes, better get out of here, the ceiling is about to crumble"
    print "Press Enter to continue."
    gets
    hallway(0)
  when "b"
    puts "You have no cellphone on you and the phones inside what is left of the booth are dead."
    i -= ["b"]
    print "Press Enter to continue."
    gets
    wake_up(i)
  when "c"
    puts "Cells are open guards and inmates' bodies everywhere. You better get out of here!"
    i -= ["c"]
    print "Press Enter to continue."
    gets
    wake_up(i)
  else
    puts "Someone runs behind you and knocks you out"
    print "Press Enter to continue."
    gets
    wake_up(i)
  end
end

def play_again
  print "\nPlay again? (Y/N)"
  answer = gets.chomp.downcase.strip
  case answer
  when "y"
    var = ["a","b","c"]
    wake_up(var)
  when "n"
    return true
  else
    print "\nThat's not a valid answer dummy!"
    play_again
  end
end

# GAME STARTS HERE
begin  print `clear`
  puts "Welcome to Batman: Arkham Asylum!"
  sleep(2)
  wake_up(var)
  exit_game = play_again
end until exit_game == true

