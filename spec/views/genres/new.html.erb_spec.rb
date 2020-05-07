# frozen_string_literal: true

describe 'genres/new' do
  before(:each) do
    assign(:genre, Genre.new(
                     name: 'MyString',
                     description: 'MyText'
                   ))
  end
  let(:user) { create(:user, :with_profile) }

  context 'while logged in' do
    it 'renders new genre form' do
      sign_in(user)

      render

      assert_select 'form[action=?][method=?]', genres_path, 'post' do
        assert_select 'input[name=?]', 'genre[name]'

        assert_select 'textarea[name=?]', 'genre[description]'
      end
    end
  end
end
