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
require_relative 'train'

station1 = Station.new('Text1')

train1 = Train.new('2ab-as')
