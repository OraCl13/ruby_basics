# frozen_string_literal: true

# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)
n = 1
result_hash = {}
('a'..'z').each do |letter|
  result_hash[letter] = n if %w[a e y o u i].include? letter
  n += 1
end
puts result_hash
