# frozen_string_literal: true

# Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным,
# используя теорему Пифагора (www-formula.ru) и выводит результат на экран.
# Также, если треугольник является при этом равнобедренным (т.е. у него равны любые 2 стороны),
# то дополнительно выводится информация о том, что треугольник еще и равнобедренный.
# Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную сторону (гипотенуза)
# и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон.
# Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.

puts 'Enter three triangle sides: '
a = Integer(gets.chop)
b = Integer(gets.chop)
c = Integer(gets.chop)

sum_values = a + b + c
max_value = [a, b, c].max
min_value = [a, b, c].min
#validations
puts 'Triangle is '
print 'Equal-side, ' if a == b && b == c && c == a
print '2 Equal-side, ' if a == b || b == c || a == c
print 'with angle equal to 90' if max_value ** 2 == min_value ** 2 + (sum_values - max_value - min_value) ** 2
