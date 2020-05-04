# frozen_string_literal: true

describe 'genres/new' do
  before(:each) do
    assign(:genre, Genre.new(
                     name: 'MyString',
                     description: 'MyText'
                   ))
  end

  it 'renders new genre form' do
    render

    assert_select 'form[action=?][method=?]', genres_path, 'post' do
      assert_select 'input[name=?]', 'genre[name]'

      assert_select 'input[name=?]', 'genre[description]'
    end
  end
end
