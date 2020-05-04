# frozen_string_literal: true

describe 'genres/index' do
  before(:each) do
    assign(:genres, [
             Genre.create!(
               name: 'Name',
               description: 'MyText'
             ),
             Genre.create!(
               name: 'Name',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of genres' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
