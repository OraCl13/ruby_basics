class Station
  attr_reader :trains_info, :name

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
    return puts 'Empty station' if @trains_info.empty?

    return puts 'We dont have this train' unless @trains_info.include? train

    puts 'Train was send out'
    @trains_info.delete(train)
  end
end
