class PokemonService < BaseService
  # class << self
    def parse_list(page = 1)
      parse('pokemon', page)
    end

    def parse_item(poke_api_object)
      poke_api_object.get
    end
  # end
end