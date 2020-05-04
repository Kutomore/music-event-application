# frozen_string_literal: true

describe '/genres' do
  let(:valid_attributes) do
    {
      name: Faker::Music.genre,
      description: 'Initial description'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      description: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Genre.create! valid_attributes
      get genres_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      genre = Genre.create! valid_attributes
      get genre_url(genre)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_genre_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      genre = Genre.create! valid_attributes
      get edit_genre_url(genre)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Genre' do
        expect do
          post genres_url, params: { genre: valid_attributes }
        end.to change(Genre, :count).by(1)
      end

      it 'redirects to the created genre' do
        post genres_url, params: { genre: valid_attributes }
        expect(response).to redirect_to(genre_url(Genre.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Genre' do
        expect do
          post genres_url, params: { genre: invalid_attributes }
        end.to change(Genre, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post genres_url, params: { genre: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          description: 'Test genre description'
        }
      end

      it 'updates the requested genre' do
        genre = Genre.create! valid_attributes
        patch genre_url(genre), params: { genre: new_attributes }
        genre.reload
        expect(genre.description).to eq('Test genre description')
      end

      it 'redirects to the genre' do
        genre = Genre.create! valid_attributes
        patch genre_url(genre), params: { genre: new_attributes }
        genre.reload
        expect(response).to redirect_to(genre_url(genre))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        genre = Genre.create! valid_attributes
        patch genre_url(genre), params: { genre: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested genre' do
      genre = Genre.create! valid_attributes
      expect do
        delete genre_url(genre)
      end.to change(Genre, :count).by(-1)
    end

    it 'redirects to the genres list' do
      genre = Genre.create! valid_attributes
      delete genre_url(genre)
      expect(response).to redirect_to(genres_url)
    end
  end
end
