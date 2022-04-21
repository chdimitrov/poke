# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    @pokemons = Pokemon.includes(:types).all.limit(50)
    response = JSONAPI::Serializer.serialize(@pokemons,
                                             { fields: { pokemons: %i[name types] },
                                               is_collection: true })
    render json: response
  end

  def show
    render json: JSONAPI::Serializer.serialize(@pokemon)
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.fetch(:pokemon, {})
  end
  
  def test_to_delete
    
  end
end
