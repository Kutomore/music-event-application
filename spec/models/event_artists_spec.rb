# frozen_string_literal: true

describe EventArtist do
  it { is_expected.to belong_to(:artist) }
  it { is_expected.to belong_to(:event) }

  it { is_expected.to validate_uniqueness_of(:playing_order).scoped_to(:event_id) }

  context 'when the event is a festival' do
    before { allow(subject).to receive(:event).and_return( build(:event, event_type: :festival)) }
    it { is_expected.to validate_presence_of(:playing_order) }
  end
end
