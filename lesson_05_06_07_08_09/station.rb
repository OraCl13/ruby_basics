# frozen_string_literal: true

require_relative 'modules/validate'

class Station

  attr_reader :trains_info, :name

  @@all_stations = []
  STATION_RE = /^[A-Z]\w{3,7}$/.freeze
  def initialize(name)
    @name = name
    @trains_info = []
    #valid?(STATION_RE, @name, 'Station name doesnt match to requirements')

    @@all_stations.push(self)
  end

  def self.all
    @@all_stations
  end

  def trains_in(&block)
    @trains_info.each do |train|
      block.call(train) # yield
    end
  end

  def add_train(train)
    return puts 'Train already here' if @trains_info.include? train

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
    return puts 'Empty station' if @trains_info.empty?

    return puts 'We dont have this train' unless @trains_info.include? train

    @trains_info.delete(train)
  end
end
