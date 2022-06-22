# frozen_string_literal: true

# Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
# Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

print 'Base: '
a = Integer(gets.chop)

print 'Height: '
h = Integer(gets.chop)

if a < 0 || b < 0
  puts 'Error'
else
  puts "#{0.5 * a * h} - triangle area"
end
