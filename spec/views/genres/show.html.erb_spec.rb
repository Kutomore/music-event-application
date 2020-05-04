# frozen_string_literal: true

describe 'genres/show' do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
                              name: 'Name',
                              description: 'MyText'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
