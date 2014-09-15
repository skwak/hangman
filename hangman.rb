require "colorize"

class Hangman
  attr_accessor :word, :guess, :fill

  def initialize(word)
    @word = word
    @guess = guess
    @fill = Array.new(word.length, "#")
    @all_guesses = []
    @wrong_letter_situations = 0
    @possible_win = true
    @head = ""
    @body = ""
    @left_arm = ""
    @right_arm = ""
    @left_leg = ""
    @right_leg = ""
  end

  def hang
    puts " ==========                                     "
    puts " |        |                                     "
    puts " |      #{@head}                                "
    puts " |       #{@left_arm}#{@body}#{@right_arm}      "
    puts " |      #{@left_leg}#{@right_leg}               "
    puts " |                                              "
    puts "=====                                           "
    show_guess
  end

  def fill
    @fill
  end

  def ask_guess
    puts "Guess a letter."
    @guess = gets.chomp
    make_guess
  end

  def make_guess
    if @word.include?@guess
      @all_guesses << @guess
      word_array = @word.split(//)
      word_array.each_with_index do |letter, index|
        if @guess == letter
          @fill[index] = letter
        end
      end
      abort("YOU WON. #{@word}!".blink) if @fill.join == @word

    else
      @all_guesses << @guess
      wrong_letters
    end
  end

  def show_guess
    puts "This is your word:" + @fill.join
  end

  def wrong_letters
    @wrong_letter_situations += 1
    puts "Sorry, that letter is not in the word. Try again!"
    case @wrong_letter_situations
    when 1
      @head << "(-_-)".cyan
    when 2
      @body << "|".green
    when 3
      @left_arm << "/".red
    when 4
      @right_arm << "\\".blue
    when 5
      @left_leg << "_/".yellow
    when 6
      @right_leg << "\\_".magenta
      show_status
      abort("GAME OVER.".blink)
      @possible_win == false
    end
    show_status
    ask_guess
  end

  def show_status
    hang
    puts "You've used these letters so far: #{@all_guesses}"
    puts "You have made #{@wrong_letter_situations} wrong guess(es) so far! You can
    be wrong only 6 times."
  end

  def play
    while @possible_win
      hang
      ask_guess
      show_status
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

choose_word_array = ["spectacular", "glorious", "dastardly", "stupendous"]
my_word = Hangman.new(choose_word_array.sample)
my_word.play
