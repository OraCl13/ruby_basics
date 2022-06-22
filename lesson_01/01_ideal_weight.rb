# frozen_string_literal: true

# Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110,
#  после чего выводит результат пользователю на экран с обращением по имени.
# Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

name = gets.chop
height = Integer(gets.chop)
ideal_weight = height - 100

if ideal_weight > 0
  if ideal_weight.negative?
    puts 'Yours weight is optimal at the moment'
  else
    puts "#{name} yours ideal weight is #{ideal_weight}"
  end
else
  puts 'Your weight whould not be negative'
end