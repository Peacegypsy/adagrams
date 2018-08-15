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

    word.split("").each do |letter|
      letter = letter.upcase.to_sym
      case letter
      when :A, :E, :I, :O, :U, :L, :N, :R, :S, :T
        word_score += 1
      when :D, :G
        word_score += 2
      when :B, :C, :M, :P
        word_score += 3
      when :F, :H, :V, :W, :Y
        word_score += 4
      when :K
        word_score += 5
      when :J, :X
        word_score += 8
      when :Q, :Z
        word_score += 10
      end
    end

    word_score += 8 if (7..10).include?(word.length)

    return word_score
  end

  def highest_score_from(words)
    best_word = {word: nil,score: 0}
    words.each do |word|
      if score_word(word) > best_word[:score]
        best_word[:score] = score_word(word)
        best_word[:word] = word
      elsif score_word(word) == best_word[:score]
        if word.length < best_word[:word].length
          best_word[:score] = score_word(word)
          best_word[:word] = word

        end
      end
    end
    best_word
  end
