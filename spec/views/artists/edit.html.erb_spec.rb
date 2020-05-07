# frozen_string_literal: true

describe 'artists/edit' do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
                                name: 'MyString'
                              ))
  end

  let(:user) { create(:user, :with_profile) }

  context 'while logged in' do
    it 'renders the edit artist form' do
      sign_in(user)
      render

      assert_select 'form[action=?][method=?]', artist_path(@artist), 'post' do
        assert_select 'input[name=?]', 'artist[name]'
      end
    end
  end
end
