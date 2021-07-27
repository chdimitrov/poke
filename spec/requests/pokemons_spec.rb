# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'GET /index' do
    let(:pokemon_1) { FactoryBot.create(:pokemon) }
    before do
      pokemon_1
    end

    it 'returns http success' do
      get '/pokemons'
      expect(response).to have_http_status(:success)
    end

    it 'returns needed attributes' do
      get '/pokemons'
      expect(response).to have_http_status(:success)
      expect(response.header['Content-type']).to include('application/json')
      pokemons = JSON.parse(response.body, symbolize_names: true)
      expect(pokemons).to be_a Hash
      expect(pokemons).to have_key(:data)
      expect(pokemons[:data]).to be_a Array
      expect(pokemons[:data].first).to have_key(:id)
      expect(pokemons[:data].first).to have_key(:attributes)
      expect(pokemons[:data].first).to have_key(:attributes)
      pokemon_attributes = pokemons[:data].first[:attributes]
      expect(pokemon_attributes).to have_key(:name)
      expect(pokemons[:data].first).to have_key(:relationships)
      expect(pokemons[:data].first[:relationships]).to have_key(:types)
    end
  end

  describe 'GET /show' do
    let(:pokemon_2) { FactoryBot.create(:pokemon) }
    it 'returns http success' do
      get "/pokemons/#{pokemon_2.id}"
      expect(response).to have_http_status(:success)
      expect(response.header['Content-type']).to include('application/json')

      pokemon = JSON.parse(response.body, symbolize_names: true)
      expect(pokemon).to be_a Hash
      expect(pokemon).to have_key(:data)
      expect(pokemon[:data]).to be_a Hash
      expect(pokemon[:data]).to have_key(:id)
      expect(pokemon[:data]).to have_key(:attributes)
      expect(pokemon[:data][:attributes]).to have_key(:name)
      expect(pokemon[:data][:attributes]).to have_key(:height)
      expect(pokemon[:data][:attributes]).to have_key(:weight)
      expect(pokemon[:data][:attributes]).to have_key(:base_experience)
      expect(pokemon[:data][:attributes]).to have_key(:is_default)
    end
  end
end
