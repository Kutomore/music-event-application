# frozen_string_literal: true

describe 'events/edit' do
  before(:each) do
    @event = assign(:event, create(:event, :with_address, :with_genres, :with_event_artists))
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
      assert_select 'input[name=?]', 'event[name]'
      assert_select 'select[name=?]', 'event[event_type]'
      assert_select 'input[name=?]', 'event[date]'
      assert_select 'input[name=?]', 'event[artist_ids][]'
      assert_select 'input[name=?]', 'event[genre_ids][]'
      assert_select 'input[name=?]', 'event[address_attributes][street]'
      assert_select 'input[name=?]', 'event[address_attributes][city]'
      assert_select 'input[name=?]', 'event[address_attributes][state]'
      assert_select 'input[name=?]', 'event[address_attributes][zip]'
      assert_select 'input[name=?][type=?]', 'commit', 'submit'
      assert_select 'a[href=?]', '/events'
    end
  end
end
