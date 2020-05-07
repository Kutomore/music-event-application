# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/edit', type: :view do
  before(:each) do
    @profile = assign(:profile, create(:profile, :with_address))
  end

  let(:user) { create(:user, :with_profile) }

  context 'while logged in' do
    it 'renders the edit profile form' do
      sign_in(user)

      render

      assert_select 'form[action=?][method=?]', profile_path(@profile), 'post' do
        assert_select 'input[name=?]', 'profile[name]'

        assert_select 'input[name=?]', 'profile[email]'

        assert_select 'input[name=?]', 'profile[phone]'

        assert_select 'select[name=?]', 'profile[gender]'
      end
    end
  end
end
