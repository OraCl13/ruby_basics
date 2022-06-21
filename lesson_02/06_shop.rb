# frozen_string_literal: true

# Пользователь вводит поочередно название товара, цену за единицу
# и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш,
# содержащий цену за единицу товара и кол - во купленного товара.Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
product_info = {}
general_price = 0
loop do
  print 'Product name: '
  product_name = gets.chop
  break if product_name == 'stop'

  print 'Product price: '
  product_price = gets.chop.to_i
  print 'Product quantity: '
  product_quantity = gets.chop.to_f
  product_info[product_name] = { product_price => product_quantity }
end

puts 'Total price for each product: '
product_info.each do |product_name, price_quantity|
  print product_name
  price_quantity.each do |product_price, product_quantity|
    general_price += product_price * product_quantity
    puts " #{product_price * product_quantity}$"
  end
end

puts 'General price: '
puts general_price
