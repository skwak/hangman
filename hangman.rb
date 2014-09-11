#INSTRUCTIONS:
#Between each guess, the board should be redrawn to the terminal output (Ascii art!).
#The letters that have already been guessed should be displayed before each time the player guesses.
#Use the colorize gem to make each piece of the hangman a different color.
#Use classes for each different idea represented in the game
#Place the application flow/logic in a method outside of any class, call this method at the end of the file to start the game.

#IDEAS OF HOW IT MIGHT RUN STEP-BY-STEP
#how to set it up:
#see an empty scaffold
#spaces representing the letters appear (maybe this should be in the array of correctly
#guessed letters. once the correct letter is called, then the correct replaces the _".
#if the letter from the word is not called, then a new body part appears on the scaffold.
#all guessed letters should appear on the screen under "guesses". maybe these guessed
#letters should be sorted in an array, and new guesses can be added to this array.
#if a letter from the word is called, then the letter appears where the space is
#if the letter from the word is called, then the body remains the same as it was before
#once the body is complete (after 6 wrong guesses), then the game is over
#once the word is complete, then the game is over

require "colorize"

#the actual stick figure
class Hangman

  attr_accessor :word, :guess

  def initialize
    @word = word
    @guess = guess
  end

  def hang
    puts "nothing here yet :-)"
  end

end

#the word. right now: "braggadocio"
class Word
  attr_accessor :word, :guess, :filling_lines

  def initialize(word)
    @word = word
    @guess = guess
    @filling_lines = spaces
  end

  def ask_guess
    puts "Can you guess my word? It's pretty hard."
    puts "Guess a letter."
    @guess = gets.chomp
    test
  end

  def test
    if word.include?@guess
      check_the_guess
    else
      puts "Your letter is not here."
      wrong_words
    end
  end

  def spaces
    Array.new(word.length, "*")
  end


  def check_the_guess
    word_array = @word.split(//)
    word_array.each_with_index do |letter, index|
      if @guess == letter
        @filling_lines[index] == letter
      end
    end
  end

  def guessed_spot
    @filling_lines.join
  end

  def wrong_words
  end

end

# welcome screen to be festive

puts "\n(・。・)/ \(・。・)/ \(・。・)/ \(・。・)/ ".magenta

puts "welcome"
puts "░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄
▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░".underline

puts "▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ 2".underline
puts "                 ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ".underline
puts "
░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄".underline
puts "░ ░ ░ ░ ░ ░ ░ "
puts "                           hangman!".blink
puts "░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄
                  ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░".underline
puts "bringing back blink text for maximum discomfort".center(50)
puts "                ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄
░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░ ░
                      ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄".underline
while
my_word = Word.new("braggadocio")

hanging = Hangman.new

  hanging.hang

  my_word.guessed_spot

  my_word.ask_guess

end
