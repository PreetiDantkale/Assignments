#List of all words
words_list = ["PERSONALITY","REVENUE","DRAWING","CLOSURE","TRAITS","DEMONSTRATION"]
#Selecting a random word as hidden word
hidden_word = words_list[rand(words_list.length)]
#creating a array of guessed letters
guessed_letters = Array.new

#displys the hidden word
def show_hidden_word(word_array)
  word_array.each {|c| print c + " "}
end

#creates a word with underscores
def create_word_array(hidden_word)
  Array.new(hidden_word.length) { "_" }
end

def check_guess_letter(hidden_word, secret_word_array, guess, guessed_letters )
  match_found = false
  word_array = hidden_word.split("")
  if guessed_letters.include?(guess)
    p "#{guess} is already guessed"
    match_found = true
  else
    guessed_letters.push(guess)
    word_array.each_with_index do |letter, index|
    if letter == guess
      secret_word_array[index] = letter
      match_found = true
    end
  end
  end
  match_found
end

def end_game(hidden_word, secret_word_array)
  if hidden_word.split("") == secret_word_array
    puts "YOU WIN"
  else
   puts " You LOOSE. The word is #{hidden_word}"
   end
end

number_of_guesses = 5
secret_word_array = create_word_array(hidden_word)
puts "Welcome to Hangman Game "
puts "You have 5 chances"
show_hidden_word(secret_word_array)

while (number_of_guesses > 0)
  puts "Enter your guess "
  guess = gets.chomp.upcase
  if check_guess_letter(hidden_word, secret_word_array, guess, guessed_letters)
    show_hidden_word(secret_word_array)
  else
	  number_of_guesses -= 1
    puts " No match for '#{guess}'. You have #{number_of_guesses} guesses left!"
  end
  if hidden_word.split("") == secret_word_array
    puts " YOU WIN!"
    break
  end
end
end_game(hidden_word, secret_word_array)
