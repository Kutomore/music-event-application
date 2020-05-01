# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'genres/new', type: :view do
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

      assert_select 'textarea[name=?]', 'genre[description]'
    end
  end
end
