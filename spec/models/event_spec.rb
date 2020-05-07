# frozen_string_literal: true

describe Event do
  it { is_expected.to have_and_belong_to_many(:genres) }
  it { is_expected.to have_many(:event_artists).dependent(:delete_all) }
  it { is_expected.to have_many(:artists).through(:event_artists) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:genres) }
  it { is_expected.to define_enum_for(:event_type).with_values(concert: 0, festival: 1) }

  context 'when it is a concert' do
    context 'with a single artist' do
      subject { create(:event, :with_genres, :with_event_artists, :with_address, event_type: :concert) }
      it { is_expected.to be_valid }
      it 'has a single artist' do
        expect(subject.artists.count).to eq(1)
      end
    end
    context 'with multiple artists' do
      subject { create(:event, :with_genres, :with_event_artists, :with_address, event_type: :festival) }
      before { subject.event_type = :concert }
      it { is_expected.not_to be_valid }
      it 'has multiple artists' do
        expect([0, 1]).not_to include(subject.artists.count)
      end
    end
  end

  describe '.without_genres' do
    let(:event) { create(:event, :with_address, :with_event_artists, :with_genres) }
    let(:genre_id) { create(:genre, name: 'test_genre').id }
    it 'includes events without the genre' do
      expect(Event.without_genres(genre_id)).to include(event)
    end
    it 'excludes events with the genre' do
      expect(Event.without_genres(event.genre_ids)).not_to include(event)
    end
  end

  describe '.with_genres' do
    let(:event) { create(:event, :with_address, :with_event_artists, :with_genres) }
    let(:genre_id) { create(:genre, name: 'test_genre').id }
    it 'includes events with the genre' do
      expect(Event.with_genres(event.genre_ids)).to include(event)
    end
    it 'excludes events without the genre' do
      expect(Event.with_genres(genre_id)).not_to include(event)
    end
  end

  describe '.with_past_date' do
    let(:past_event) { create(:event, :with_address, :with_event_artists, :with_genres, date: DateTime.current - 1.days) }
    let(:future_event) { create(:event, :with_address, :with_event_artists, :with_genres, date: DateTime.current + 1.days) }
    it 'shows only events in the past when true' do
      expect(Event.with_past_date('true')).to include(past_event)
      expect(Event.with_past_date('true')).not_to include(future_event)
    end
    it 'shows only events in the future when false' do
      expect(Event.with_past_date('false')).to include(future_event)
      expect(Event.with_past_date('false')).not_to include(past_event)
    end
  end
end
