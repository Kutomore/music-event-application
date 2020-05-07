# frozen_string_literal: true

describe '/profiles' do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:profile).merge(
      {
        address_attributes: FactoryBot.attributes_for(:address)
      }
    )
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:profile, phone: 'invalid')
  end

  let(:user) { create :user, :with_profile }

  describe 'GET /show' do
    it 'renders a successful response' do
      profile = Profile.create! valid_attributes
      get profile_url(profile)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    context 'while logged in' do
      before { sign_in(user) }
      it 'renders a successful response' do
        profile = Profile.create! valid_attributes
        get edit_profile_url(profile)
        expect(response).to be_successful
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        profile = Profile.create! valid_attributes
        get edit_profile_url(profile)
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'while logged in' do
      before { sign_in(user) }

      context 'with valid parameters' do
        let(:new_attributes) do
          {
            name: 'Test profile name'
          }
        end

        it 'updates the requested profile' do
          profile = Profile.create! valid_attributes
          patch profile_url(profile), params: { profile: new_attributes }
          profile.reload
          expect(profile.name).to eq('Test profile name')
        end

        it 'redirects to the profile' do
          profile = Profile.create! valid_attributes
          patch profile_url(profile), params: { profile: new_attributes }
          profile.reload
          expect(response).to redirect_to(profile_url(profile))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          profile = Profile.create! valid_attributes
          patch profile_url(profile), params: { profile: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        profile = Profile.create! valid_attributes
        patch artist_url(profile), params: { profile: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
