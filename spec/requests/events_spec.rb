# frozen_string_literal: true

describe '/events' do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:event, event_type: :concert).merge(
      {
        artist_ids: [FactoryBot.create(:artist).id],
        genre_ids: [FactoryBot.create(:genre).id],
        address_attributes: FactoryBot.attributes_for(:address),
        date: DateTime.current + 1.days
      }
    )
  end

  let(:invalid_attributes) do
    attributes_for(:event, event_type: :concert).merge(
      {
        genre_ids: [],
        artist_ids: [FactoryBot.create(:artist).id],
        address_attributes: FactoryBot.attributes_for(:address)
      }
    )
  end

  let(:user) { create :user, :with_profile }

  describe 'GET /index' do
    it 'renders a successful response' do
      Event.create! valid_attributes
      get events_url
      expect(response).to be_successful
    end

    context 'while logged in' do
      before do
        sign_in(user)
        user.profile.update(genre_ids: valid_attributes[:genre_ids][0])
      end

      context 'with commit param' do
        it 'should be indifferent to the user ignored genres' do
          Event.create! valid_attributes
          Event.create! valid_attributes.merge(
            name: 'Test Name',
            genre_ids: [Genre.create(name: 'Test Genre', description: 'Test').id]
          )

          get events_url, params: { commit: 'apply' }

          expect(response.body).to include(CGI::escapeHTML(valid_attributes[:name]))
          expect(response.body).to include('Test Name')
        end
      end

      context 'without any param' do
        it 'shouldnt return events with user avoided genres' do
          Event.create! valid_attributes

          get events_url

          expect(response.body).not_to include(CGI::escapeHTML(valid_attributes[:name]))
        end
        it 'should return events without user avoided genres' do
          Event.create! valid_attributes.merge(
            name: 'Test Name',
            genre_ids: [Genre.create(name: 'Test Genre', description: 'Test').id]
          )

          get events_url

          expect(response.body).to include('Test Name')
        end
      end

      context 'with genre_ids params' do
        it 'should return events with the specified genres' do
          Event.create! valid_attributes

          get events_url, params: { genre_ids: valid_attributes[:genre_ids] }

          expect(response.body).to include(CGI::escapeHTML(valid_attributes[:name]))
        end
        it 'shouldnt return events without the specified genres' do
          Event.create! valid_attributes.merge(
            name: 'Test Name',
            genre_ids: [Genre.create(name: 'Test Genre', description: 'Test').id]
          )

          get events_url, params: { genre_ids: valid_attributes[:genre_ids] }

          expect(response.body).not_to include('Test Name')
        end
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event = Event.create! valid_attributes
      get event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    context 'while logged in' do
      it 'renders a successful response' do
        sign_in(user)
        get new_event_url
        expect(response).to be_successful
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        get new_event_url
        expect(response).not_to be_successful
      end
    end
  end

  describe 'GET /edit' do
    let(:event) { Event.create! valid_attributes }

    context 'while logged in' do
      it 'renders a successful response' do
        sign_in(user)
        get edit_event_url(event)
        expect(response).to be_successful
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        get edit_event_url(event)
        expect(response).not_to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'while logged in' do
      before { sign_in(user) }

      context 'with valid parameters' do
        it 'creates a new Event' do
          expect do
            post events_url, params: { event: valid_attributes }
          end.to change(Event, :count).by(1)
        end

        it 'redirects to the created event' do
          post events_url, params: { event: valid_attributes }
          expect(response).to redirect_to(event_url(Event.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Event' do
          expect do
            post events_url, params: { event: invalid_attributes }
          end.to change(Event, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post events_url, params: { event: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'while logged out' do
      it 'does not create a new Event' do
        expect do
          post events_url, params: { event: valid_attributes }
        end.to change(Event, :count).by(0)
      end

      it 'renders a failed response' do
        post events_url, params: { event: valid_attributes }
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
            name: 'Test event name'
          }
        end

        it 'updates the requested event' do
          event = Event.create! valid_attributes
          patch event_url(event), params: { event: new_attributes }
          event.reload
          expect(event.name).to eq('Test event name')
        end

        it 'redirects to the event' do
          event = Event.create! valid_attributes
          patch event_url(event), params: { event: new_attributes }
          event.reload
          expect(response).to redirect_to(event_url(event))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          event = Event.create! valid_attributes
          patch event_url(event), params: { event: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'while logged in' do
      before { sign_in(user) }

      it 'destroys the requested event' do
        event = Event.create! valid_attributes
        expect do
          delete event_url(event)
        end.to change(Event, :count).by(-1)
      end

      it 'redirects to the events list' do
        event = Event.create! valid_attributes
        delete event_url(event)
        expect(response).to redirect_to(events_url)
      end
    end

    context 'while logged out' do
      it 'renders a failed response' do
        event = Event.create! valid_attributes
        delete event_url(event)
        expect(response).not_to be_successful
      end
    end
  end
end
