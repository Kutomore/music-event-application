# frozen_string_literal: true

describe '/artists' do
  # Artist. As you add validations to Artist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Music.band
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  let(:user) { create :user, :with_profile }

  describe 'GET /index' do
    it 'renders a successful response' do
      Artist.create! valid_attributes
      get artists_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      artist = Artist.create! valid_attributes
      get artist_url(artist)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    context 'while logged in' do
      it 'renders a successful response' do
        sign_in(user)
        get new_artist_url
        expect(response).to be_successful
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        get new_artist_url
        expect(response).not_to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'while logged in' do
      before { sign_in(user) }
      it 'renders a successful response' do
        artist = Artist.create! valid_attributes
        get edit_artist_url(artist)
        expect(response).to be_successful
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        artist = Artist.create! valid_attributes
        get edit_artist_url(artist)
        expect(response).not_to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'while logged in' do
      before { sign_in(user) }

      context 'with valid parameters' do
        it 'creates a new Artist' do
          expect do
            post artists_url, params: { artist: valid_attributes }
          end.to change(Artist, :count).by(1)
        end

        it 'redirects to the created artist' do
          post artists_url, params: { artist: valid_attributes }
          expect(response).to redirect_to(artist_url(Artist.order(created_at: :asc).last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Artist' do
          expect do
            post artists_url, params: { artist: invalid_attributes }
          end.to change(Artist, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post artists_url, params: { artist: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'while logged out' do
      it 'does not create a new Artist' do
        expect do
          post artists_url, params: { artist: valid_attributes }
        end.to change(Artist, :count).by(0)
      end

      it 'renders a failed response' do
        post artists_url, params: { artist: valid_attributes }
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
            name: 'Test artist name'
          }
        end

        it 'updates the requested artist' do
          artist = Artist.create! valid_attributes
          patch artist_url(artist), params: { artist: new_attributes }
          artist.reload
          expect(artist.name).to eq('Test artist name')
        end

        it 'redirects to the artist' do
          artist = Artist.create! valid_attributes
          patch artist_url(artist), params: { artist: new_attributes }
          artist.reload
          expect(response).to redirect_to(artist_url(artist))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          artist = Artist.create! valid_attributes
          patch artist_url(artist), params: { artist: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        artist = Artist.create! valid_attributes
        patch artist_url(artist), params: { artist: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'while logged in' do
      before { sign_in(user) }

      it 'destroys the requested event' do
        artist = Artist.create! valid_attributes
        expect do
          delete artist_url(artist)
        end.to change(Artist, :count).by(-1)
      end

      it 'redirects to the events list' do
        artist = Artist.create! valid_attributes
        delete artist_url(artist)
        expect(response).to redirect_to(artists_url)
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        artist = Artist.create! valid_attributes
        delete artist_url(artist)
        expect(response).not_to be_successful
      end
    end
  end
end
