def num_to_s(num, base)

  strings = (0..9).to_a.concat(("A".."F").to_a)

  power_of = 0

  result = []

  while num > base ** power_of
    result << strings [ (num / base ** power_of) % base ]
    power_of += 1
  end
  return result.join.reverse
end

def caesar(plain_text, cipher)
  cipher_text = ""
  alphabet = ('a'..'z').to_a
  plain_text.chars.each do |plain_char|
    cipher_text += alphabet[ (alphabet.index(plain_char) + cipher) % 26 ]
  end
  cipher_text
end