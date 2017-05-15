require 'bike'

describe Bike do
  subject(:bike) { Bike.new }

  it { is_expected.to respond_to :broken? }
  it { is_expected.to respond_to :report_broken }

  it 'can be reported broken' do
    bike.report_broken
    expect(bike).to be_broken
  end

end
