# frozen_string_literal: true

describe 'events/show' do
  before(:each) do
    @event = assign(:event, create(:event, :with_address, :with_genres, :with_event_artists))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
