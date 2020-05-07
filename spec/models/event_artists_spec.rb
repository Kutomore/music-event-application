# frozen_string_literal: true

describe EventArtist do
  it { is_expected.to belong_to(:artist) }
  it { is_expected.to belong_to(:event) }

  it { is_expected.to validate_uniqueness_of(:playing_order).scoped_to(:event_id) }

  context 'when the event is a festival' do
    before { allow(subject).to receive(:event).and_return(build(:event, event_type: :festival)) }
    it { is_expected.to validate_presence_of(:playing_order) }
  end

  context 'when the event is not a festival' do
    before { allow(subject).to receive(:event).and_return(build(:event, event_type: :concert)) }
    it { is_expected.not_to validate_presence_of(:playing_order) }
  end

  context 'with an invalid event' do
    before do
      allow(subject).to receive(:event).and_return(build(:event, event_type: :festival))
      subject.event.event_type = :concert
    end

    it { is_expected.not_to be_valid }
  end

  context 'with an invalid artist' do
    before do
      allow(subject).to receive(:artist).and_return(build(:artist))
      subject.artist.name = nil
    end

    it { is_expected.not_to be_valid }
  end
end
