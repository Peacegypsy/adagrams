  def draw_letters
    alphabet = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 2,
      X: 1,
      Y: 2,
      Z: 1
    }

    hand = []
    tiles_drawn = 0
    until tiles_drawn == 10
      letter = alphabet.keys.sample
      if alphabet[letter] > 0
        alphabet[letter] -= 1
        hand << letter.to_s
        tiles_drawn += 1
      end
    end
    hand

  end

  def uses_available_letters?(input, letter_in_hand)
    input.split("").each do |letter|
      if !letter_in_hand.include? letter
        return false
      elsif letter_in_hand.include? letter
        index = letter_in_hand.find_index(letter)
        letter_in_hand.delete_at(index)
      end
    end
      return true
  end

  def score_word(word)
    word_score = 0

    letter_values = {
      A: 1,
      B: 3,
      C: 3,
      D: 2,
      E: 1,
      F: 4,
      G: 2,
      H: 4,
      I: 1,
      J: 8,
      K: 5,
      L: 1,
      M: 3,
      N: 1,
      O: 1,
      P: 3,
      Q: 10,
      R: 1,
      S: 1,
      T: 1,
      U: 1,
      V: 4,
      W: 4,
      X: 8,
      Y: 4,
      Z: 10
    }

    word.split("").each do |letter|
      word_score += letter_values[letter.upcase.to_sym]
    end

    word_score += 8 if word.length >= 8 || word.length <= 10

    word_score
  end
