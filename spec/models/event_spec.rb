# frozen_string_literal: true

describe Event do
  it { is_expected.to have_and_belong_to_many(:genres) }
  it { is_expected.to have_many(:event_artists).dependent(:delete_all) }
  it { is_expected.to have_many(:artists).through(:event_artists) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:genres) }
  it { is_expected.to define_enum_for(:event_type).with_values(concert: 0, festival: 1) }

  context 'is a concert' do
    before { allow(subject).to receive(:concert?).and_return(true) }
    it { is_expected.to validate_length_of(:artists).is_at_most(1) }
  end

  it 'is correctly ordered' do
    events = FactoryBot.create_list(:event, 3, :with_genres, :with_event_artists, :with_address)

    [1.minute.ago, 5.minutes.ago, 1.hour.ago].each_with_index do |time, index|
      event = events[index]
      event.created_at = time
      event.save
    end

    sorted_events = Event.all
    expect(events.first).to eq(sorted_events.last)
    expect(events.second).to eq(sorted_events.second)
    expect(events.third).to eq(sorted_events.first)
  end

  describe '.without_genres' do
    event = create(:event, :with_address, :with_event_artists, :with_genres)
    genre_id = create(:genre, name: 'test_genre').id
    it 'includes events without the genre' do
      expect(Event.without_genres(genre_id)).to include(event)
    end
    it 'excludes events with the genre' do
      expect(Event.without_genres(event.genre_ids)).not_to include(event)
    end
  end

  describe '.without_genres' do
    event = create(:event, :with_address, :with_event_artists, :with_genres)
    genre_id = create(:genre, name: 'test_genre').id
    it 'includes events without the genre' do
      expect(Event.without_genres(genre_id)).to include(event)
    end
    it 'excludes events without the genre' do
    end
  end
end
