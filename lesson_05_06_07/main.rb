# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'product_train'
require_relative 'passenger_van'
require_relative 'product_van'

class TextController
  def initialize
    @stations = []
    @trains = []
  end

  def menu
    list = " Choose option:
    Create station - 1
    Create train - 2
    Add van to train - 3
    Delete van from train  - 4
    Add train to station - 5
    List stations - 6
    List trains on station - 7
    Take sit or place smth - 8"
    puts list
  end

  def start
    loop do
      menu
      program
    end
  end

  def program
    puts 'Choice: '
    action = gets.chomp.to_i
    case action
    when 1
      create_station
    when 2
      create_train
    when 3
      add_van
    when 4
      remove_van
    when 5
      add_train_to_station
    when 6
      print_stations
    when 7
      print_stations_and_trains
    when 8
      take_space
    else
      exit
    end
  end

  def create_station
    puts 'Choose name for station: '
    name = gets.chomp
    station = Station.new(name)
    @stations.push(station)
    puts "Station created #{name}"
  rescue TypeError
    puts 'Try again'
    retry
  end

  def print_stations
    @stations.each_with_index { |station, n| puts "Index #{n} and station name #{station.name}" }
  end

  def create_train
    puts 'Choose type of train 1 - Passenger; 2 - Product: '
    train_type = gets.chomp

    puts 'Train number: '
    train_num = gets.chomp
    case train_type
    when '1'
      @trains.push(PassengerTrain.new(train_num))
      puts "Passenger train with number #{train_num}"
    when '2'
      @trains.push(ProductTrain.new(train_num))
      puts "Product train with number #{train_num}"
    else
      puts 'wrong choice. try one more time'
    end
  rescue TypeError
    puts 'Try again'
    retry
  end

  def print_trains
    @trains.each_with_index { |train, n| puts "Index #{n} and train number #{train.num}" }
  end

  def add_van
    print_trains
    puts 'Choose index of train: '
    number = gets.chomp.to_i # train number
    return puts 'We dont have such train' unless @trains[number]

    case @trains[number].type
    when :product
      puts 'Enter volume to give or also 0 not to do '
      volume = gets.chomp.to_i # van number

      puts 'To product train will be sticked product van'
      @trains[number].add_van(ProductVan.new(volume))
    when :passenger
      puts 'Enter number of places to give or also 0 not to do '
      num_places = gets.chomp.to_i # van number

      puts 'To passenger train will be sticked passenger van'
      @trains[number].add_van(PassengerVan.new(num_places))
    end
  end

  def remove_van
    print_trains
    puts 'Choose index of train: '
    number_train = gets.chomp.to_i
    return puts 'We dont have trains at all' if @trains[number_train].vans.count.zero?
    return puts 'We dont have such train' unless @trains[number_train]

    puts "We have #{@trains[number_train].vans.count}"
    @trains[number_train].vans.each_with_index { |van, ind| puts "Index #{ind} and van type #{van.type}" }
    puts 'Choose index of van to delete: '
    number_van = gets.chomp.to_i
    @trains[number_train].remove_van(@trains[number_train].vans[number_van])
  end

  def add_train_to_station
    puts 'Choose station index: '
    print_stations
    num_st = gets.chomp.to_i

    puts 'Choose index of train: '
    print_trains
    num_tr = gets.chomp.to_i
    @stations[num_st].add_train(@trains[num_tr])

    puts "On station #{@stations[num_st]} arrived train #{@trains[num_tr]}"
  end

  def print_stations_and_trains
    @stations.map do |station|
      puts "Station naming: #{station.name}"
      station.trains_in do |train|
        puts "  Train with #{train.num} and #{train.vans.length} vans"
        van_counter = 1
        train.vans_in do |van|
          if van.type == :product
            puts "    #{van.type} van with #{van_counter} number: #{van.in_access_v} avaible #{van.reserved_v} reserved"
          else
            puts "    #{van.type} van with #{van_counter} number: #{van.free_pl} avaible #{van.taken_pl} reserved"
          end
          van_counter += 1
        end
      end
    end
  end

  def take_space
    puts 'Choose train on which u want to sit or place smth'
    print_trains
    number_train = gets.chomp.to_i

    puts 'Choose van'
    @trains[number_train].vans.each_with_index { |van, index| puts "Van #{index} & #{van.type}" }
    number_van = gets.chomp.to_i
    selected_van = @trains[number_train].vans[number_van]
    if selected_van.type == :product
      puts "How much space do u want to select. Max #{selected_van.in_access_v}"
      selected_van.reserve_volume(gets.chomp.to_i)
      puts 'Reserved'
    else
      puts "We have: #{selected_van.free_pl} seats"
      selected_van.take_place
      puts 'Good way!'
    end
  end

end

controller = TextController.new
controller.start
