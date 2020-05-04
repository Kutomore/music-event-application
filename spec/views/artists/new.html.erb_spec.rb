# frozen_string_literal: true

describe 'artists/new' do
  before(:each) do
    assign(:artist, Artist.new(
                      name: 'MyString'
                    ))
  end

  it 'renders new artist form' do
    render

    assert_select 'form[action=?][method=?]', artists_path, 'post' do
      assert_select 'input[name=?]', 'artist[name]'
    end
  end
end
