require "colorize"

#the actual stick figure
class Hangman

  attr_accessor :word, :guess

  def initialize
    @head = "(-_-)".cyan
    @left_arm = "/".red
    @right_arm = "\\".blue
    @body = "O".green
    @left_leg = ",|".yellow
    @right_leg = "|,".magenta
  end

  def hang
    puts " ==========                                     "
    puts " |        |                                     "
    puts " |      #{@head}                                "
    puts " |       #{@left_arm}#{@body}#{@right_arm}      "
    puts " |       #{@left_leg}#{@right_leg}              "
    puts " |                                              "
    puts "=====                                           "
  end

end

#the word. right now: "braggadocio"
class Word
  attr_accessor :word, :guess, :fill

  def initialize(word)
    @word = word
    @guess = guess
    @fill = Array.new(word.length, "x")
    @all_guesses = []
  end

  def fill
    @fill
  end

  def ask_guess
    puts "Can you guess my word? It's pretty hard."
    puts "Guess a letter."
    @guess = gets.chomp
    make_guess
  end

  def make_guess
    return false if @all_guesses.include?(@guess)
    @all_guesses << @guess
    if @word.include?guess
      word_array = @word.split(//)
      letter_index = word_array.index(@guess)
      @fill[letter_index] = @guess
    else wrong_letters
    end
  end

  def show_guess
    puts @fill.join
  end

  def wrong_letters
    @all_guesses << @guess
    wrong_letter_situations = 0
    wrong_letter_situations += 1
    if wrong_letter_situations < 6
      puts "Sorry, that letter is not in the word. Try again!"
      @guess = gets.chomp
      make_guess
    else
      abort("Sorry you made too many guesses. This game is over.")
    end
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
my_word.ask_guess
my_word.show_guess

end
