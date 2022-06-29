# frozen_string_literal: true

# Создать модуль, который позволит указывать название компании-производителя и получать его.
# Подключить модуль к классам Вагон и Поезд
# В классе Station(жд станция)создать метод класса all,который возвращает все станции (объекты),созданные на данный мом
# Добавить к поезду атрибут Номер (произвольная строка), если его еще нет, который указыватеся при его создании
# В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании)
# и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.

require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'product_train'
require_relative 'passenger_van'
require_relative 'product_van'

station1 = Station.new('Text1')

train1 = PassengerTrain.new('1ab-2b')
train2 = ProductTrain.new('1ab-2b')

station1.add_train(train1)
station1.add_train(train2)
pass_van = PassengerVan.new(100)
pass_van1 = PassengerVan.new(100)
pass_van2 = PassengerVan.new(100)

train1.add_van(pass_van)
train1.add_van(pass_van1)
train1.add_van(pass_van2)

station1.trains_in { |train| puts train }
puts 'x' * 30
train1.vans_in { |elem| puts elem }
