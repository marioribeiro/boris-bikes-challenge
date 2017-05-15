require 'docking_station'

describe DockingStation do

  subject(:docking_station) { DockingStation.new }

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(docking_station.dock(bike)).to eq bike
    end
  end
  
  describe '#release_bike' do
    it 'releases a bike' do
      expect(bike).to be_working
    end
  end

end
