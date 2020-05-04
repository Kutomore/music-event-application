# frozen_string_literal: true

describe 'artists/index' do
  before(:each) do
    assign(:artists, [
             Artist.create!(
               name: 'Name'
             ),
             Artist.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of artists' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
