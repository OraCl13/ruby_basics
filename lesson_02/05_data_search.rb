# frozen_string_literal: true

# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru
month_days = [31, 28, 31, 30, 31, 30,
              31, 31, 30, 31, 30, 31]
puts 'Enter day, month and then year: '
day = gets.chop.to_i
month = gets.chop.to_i
year = gets.chop.to_i

high_year = ((year % 4).zero? && (year % 100 != 0) || (year % 400).zero?) || false

(0...month - 1).map { |i| day += month_days[i] }

if high_year
  puts day
else
  puts day - 1
end
