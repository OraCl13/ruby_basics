# frozen_string_literal: true

# Заполнить массив числами от 10 до 100 с шагом 5

array = []
(10..100).step(5).each do |element|
  array.push(element)
end

puts array
