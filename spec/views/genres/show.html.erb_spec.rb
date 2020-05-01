# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'genres/show', type: :view do
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
