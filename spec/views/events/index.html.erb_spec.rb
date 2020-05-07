# frozen_string_literal: true

describe 'events/index' do
  before(:each) do
    assign(:events, create_list(:event, 2, :with_address, :with_genres, :with_event_artists))
  end

  it 'renders a list of events' do
    render
    assert_select 'tr', count: 6
    assert_select 'td', count: 16
    assert_select 'a[href=?]', '/events/new'
    assert_select 'a', text: 'Show'
  end
  it 'renders the filters' do
    render
    assert_select 'input[id=?][placeholder=?][oninput=?]', 'SearchBar', 'Search for options..', 'updateCheckboxes(this)'
    assert_select 'div[class=?]', 'col-md-6 checkbox-list no-side-padding', count: 2
    assert_select 'input[name=?][type=?]', 'commit', 'submit'
    assert_select 'input[name=?][type=?][onclick=?]', 'commit', 'submit', 'uncheckAll(event)'
  end
end
