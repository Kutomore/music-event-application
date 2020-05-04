# frozen_string_literal: true

describe Artist do
  it { is_expected.to have_many(:event_artists) }
  it { is_expected.to have_many(:events).through(:event_artists) }
  it { is_expected.to validate_presence_of(:name) }
end
