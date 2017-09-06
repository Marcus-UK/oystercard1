require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:station) {double :station}
  describe '# in_journey?' do
    it { is_expected.to respond_to(:in_journey?)}

    it ' is expected to return false at start' do
      expect(journey.in_journey?).to eq false
    end
  end

  describe '# touch_in' do
    it 'should record the entry station in journey' do
      journey.touch_in(station)
      current_journey = journey.journey
      expect(current_journey[:entry_station]).to eq station
    end
  end
end
