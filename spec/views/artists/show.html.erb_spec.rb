# frozen_string_literal: true

describe 'artists/show' do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
                                name: 'Name'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
