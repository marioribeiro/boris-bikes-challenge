require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bike
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if  working_bikes.empty?
    @bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    fail 'Docking Station full' if full?
    @bikes << bike
  end

  def report_damaged_bike(bike)
    bike.report_broken
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

   def working_bikes
    @bikes.reject{|bike| bike.broken?}
  end


end
