# frozen_string_literal: true

describe 'artists/index' do
  before(:each) do
    assign(:artists, [
             Artist.create!(
               name: 'Name'
             ),
             Artist.create!(
               name: 'Name'
             )
           ])
  end

  let(:user) { create(:user, :with_profile) }

  it 'renders a list of artists' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'a>span', text: 'Show'.to_s, count: 2
  end

  context 'while logged in' do
    before { sign_in(user) }

    it 'shows the edit action button' do
      render

      assert_select 'a', text: 'Edit'.to_s, count: 2
    end

    it 'shows the delete action button' do
      render

      assert_select 'a', text: 'Delete'.to_s, count: 2
    end
  end
end
