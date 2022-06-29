# frozen_string_literal: true

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может показывать список всех поездов на станции, находящиеся в текущий момент
# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :trains_info

  def initialize(name)
    @name = name
    @trains_info = []
  end

  def add_train(train)
    return puts 'Train already here' if @trains_info.include? train

    puts "Train added to #{@name}"
    @trains_info.push(train)
  end

  def detail_trains
    prod_train = 0
    passenger_train = 0
    return puts 'It is empty' if @trains_info.empty?

    @trains_info.map { |train| train.type == 'passenger' ? passenger_train += 1 : prod_train += 1 }
    puts "So we have #{prod_train} product trains and #{passenger_train} passenger trains"
  end

  def send_train(train)
    return puts 'Empty station or we dont have this train' if @trains_info.empty? || !(@trains_info.include? train)

    puts 'Train was send out'
    @trains_info.delete(train)
  end
end

# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
# эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, м
# етод просто увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_reader :current_speed, :type, :current_station

  def initialize(number, type, n_vans)
    @number = number
    @type = type
    @n_vans = n_vans
    @current_speed = 0
    @route = nil
  end

  def speed_up
    @current_speed += 10
  end

  def slow_down
    @current_speed = 0
  end

  def add_van
    return puts 'Stop please to add van' unless @current_speed.zero?

    puts 'Van added'
    @n_vans += 1
  end

  def remove_van
    puts @n_vans
    return puts 'Stop please to remove van or add one more' if !@current_speed.zero? || @n_vans.zero?

    puts 'Van removed'
    @n_vans -= 1
  end

  def get_route(route)
    @route = route
    @current_station = @route.list_st[0]
    puts 'Route added'
  end

  def move_to_next
    return unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return unless current_index + 1 < @route.list_st.count

    puts 'Move to the next'
    @route.list_st[current_index].send_train(self)
    @current_station = @route.list_st[current_index + 1]
    @current_station.add_train(self)
  end

  def next_station
    return unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return puts 'It is already final' unless current_index + 1 < @route.list_st.count

    @route.list_st[current_index + 1]
  end

  def previous_station
    return unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return puts 'It is start' if current_index.zero?

    @route.list_st[current_index - 1]
  end
end

# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_reader :list_st

  def initialize(start_st, end_st)
    @start_st = start_st
    @end_st = end_st
    @list_st = [start_st, end_st]
  end

  def add_station(station)
    return puts 'There are already such station' if @list_st.include? station

    @list_st.insert(-2, station)
    puts 'Station successfully added'
  end

  def remove_station(station)
    return puts 'we cannot do this' if station == @start_st || station == @end_st || !@list_st.include?(station)

    @list_st.delete(station)
    puts 'Station successfully removed'
  end
end

station1 = Station.new('station1')
train1 = Train.new(1, 'passenger', 5)
train2 = Train.new(2, 'product', 1)

station2 = Station.new('station2')
train3 = Train.new(3, 'product', 1)
train4 = Train.new(4, 'passenger', 2)

station3 = Station.new('station3')
train5 = Train.new(5, 'passenger', 6)
train6 = Train.new(6, 'product', 2)

station1.add_train(train1)
station1.add_train(train2)

station2.add_train(train3)
station2.add_train(train4)

station3.add_train(train5)
station3.add_train(train6)

puts 'x' * 30


rout1 = Route.new(station1, station2)

rout1.add_station(station3)

train1.get_route(rout1)

puts rout1.list_st

puts 'x' * 30

# puts train1.current_station

puts train1.next_station
puts train1.previous_station

train1.move_to_next

puts train1.next_station
puts train1.previous_station

train1.move_to_next

puts train1.next_station
