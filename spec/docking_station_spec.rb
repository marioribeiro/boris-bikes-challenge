require 'docking_station'

describe DockingStation do

  subject(:docking_station) { DockingStation.new }
  let(:bike) { double(:bike) }

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }
  it { is_expected.to respond_to(:report_damaged_bike).with(1).argument }


  it 'has a default capacity' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has variable capacity' do
      described_class::DEFAULT_CAPACITY.times { docking_station.dock bike = double(:bike) }
      expect { docking_station.dock double(:bike) }.to raise_error 'Docking Station full'
    end

  end

  describe '#dock' do
    it 'docks a bike' do
      bike = double(:bike, broken?: false)
      expect(docking_station.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times do
        docking_station.dock(double(:bike))
      end
      expect { docking_station.dock double(:bike) }.to raise_error 'Docking Station full'
    end

  end
  
  describe '#release_bike' do
    let(:bike) {double :bike }
    it 'releases a working bike' do
      bike = double(:bike, broken?: false)
      docking_station.dock(bike)
      docking_station.release_bike
      expect(bike).to_not be_broken
    end

    it 'docks and releases a bike' do
      bike = double(:bike, broken?: false)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when no bikes are available' do
      expect { docking_station.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error if there are not working bikes available' do
      bike = double(:bike, broken?: true)
      docking_station.dock(bike)
      expect { docking_station.release_bike }.to raise_error 'No working bikes available'
    end

  end

  describe '#report_damaged_bike' do
    it 'allows user to report a damaged bike' do
      bike = double(:bike, broken?: true)
      docking_station.dock(bike)
      allow(bike).to receive(:report_broken).and_return(true)
      docking_station.report_damaged_bike(bike)
      expect(bike).to be_broken 
    end
  end

end
