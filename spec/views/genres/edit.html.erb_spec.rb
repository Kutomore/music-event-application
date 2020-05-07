# frozen_string_literal: true

describe 'genres/edit' do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
                              name: 'MyString',
                              description: 'MyText'
                            ))
  end
  let(:user) { create(:user, :with_profile) }

  context 'while logged in' do
    it 'renders the edit genre form' do
      sign_in(user)

      render

      assert_select 'form[action=?][method=?]', genre_path(@genre), 'post' do
        assert_select 'input[name=?]', 'genre[name]'

        assert_select 'textarea[name=?]', 'genre[description]'
      end
    end
  end
end
