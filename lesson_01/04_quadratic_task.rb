# frozen_string_literal: true

# Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть)
# и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"

puts 'Enter three coefs a,b and c: '
a = Integer(gets.chop)
b = Integer(gets.chop)
c = Integer(gets.chop)

d = b * b - 4 * a * c
puts(-b / (2 * a)) if d.zero?
puts((-b + Math.sqrt(d)) / (2 * a), (-b - Math.sqrt(d)) / (2 * a)) if d.positive?
puts 'There is no solutions' if d.negative?
