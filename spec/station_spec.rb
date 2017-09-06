require './lib/station.rb'
describe Station do
  subject(:station) { described_class.new('Fake Street', 1) }

  it 'knows it name' do
    expect(station.name).to eq 'Fake Street'
  end

  it 'Knows its zone' do
    expect(station.zone).to eq 1
  end
end
