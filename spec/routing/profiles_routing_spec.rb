# frozen_string_literal: true

describe ProfilesController do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/profiles/1').to route_to('profiles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/profiles/1/edit').to route_to('profiles#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/profiles/1').to route_to('profiles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/profiles/1').to route_to('profiles#update', id: '1')
    end
  end
end
