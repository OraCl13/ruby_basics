# frozen_string_literal: true

# Заполнить массив числами фибоначи до 100
fib1 = fib2 = 1
array = [fib1, fib2]
while fib2 + fib1 < 100
  fib1, fib2 = fib2, fib1 + fib2
  array.push(fib2)
end

puts array
