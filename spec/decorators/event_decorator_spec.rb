# frozen_string_literal: true

describe EventDecorator do
  let(:event) { build(:event, :with_address, :with_event_artists, :with_genres) }
  let(:decorated) { event.decorate }

  it 'is expected to humanize event_type' do
    expect(decorated.event_type).to eq(event.event_type.humanize)
  end
  it 'is expected to decorate artists' do
    expect(decorated.artists).to eq(event.artists.map(&:name).join(', '))
  end
  it 'is expected to decorate genres' do
    expect(decorated.genres).to eq(event.genres.map(&:name).join(', '))
  end
  it 'is expected to decorate address' do
    expect(decorated.address.to_s).to eq(event.address.decorate.to_s)
  end
end
