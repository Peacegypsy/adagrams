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
