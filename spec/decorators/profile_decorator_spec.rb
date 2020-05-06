# frozen_string_literal: true

describe ProfileDecorator do
  let(:profile) { build(:profile, :with_address, :with_genres) }
  let(:decorated) { profile.decorate }

  it 'is expected to humanize gender' do
    expect(decorated.gender).to eq(event.gender.humanize)
  end
  it 'is expected to decorate genres' do
    expect(decorated.genres).to eq(event.genres.map(&:name).join(', '))
  end
  it 'is expected to decorate address' do
    expect(decorated.address.to_s).to eq(event.address.decorate.to_s)
  end



end
