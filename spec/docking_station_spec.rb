require 'docking_station'

describe DockingStation do

  subject(:docking_station) { DockingStation.new }

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(docking_station.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times do
        docking_station.dock(Bike.new)
      end
      expect { docking_station.dock Bike.new }.to raise_error 'Docking Station full'
    end

  end
  
  describe '#release_bike' do
    it 'releases a working bike' do
      bike = Bike.new
      docking_station.dock(bike)
      docking_station.release_bike
      expect(bike).to be_working
    end

    it 'docks and releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when no bikes are available' do
      expect { docking_station.release_bike }.to raise_error 'No bikes available'
    end

  end

end
