namespace :poke do
  desc 'Import data by consuming the Poke API'
  task import_data: :environment do
    # consume type resource
    type_response = TypeService.new.parse_list.results
    type_response.each do |item|
      Type.find_or_create_by(name: item.name)
    end

    # consume pokemon resource
    page = 1

    while (pokemons_response = PokemonService.new.parse_list(page).results)
      break unless pokemons_response.any?

      pokemons_response.each do |pokemon_response|
        puts "#{pokemon_response.name} | #{pokemon_response.url}"
        pokemon_entry = pokemon_response.get
        pokemon = Pokemon.find_or_create_by(name: pokemon_entry.name)

        pokemon.update(name: pokemon_entry.name, height: pokemon_entry.height,
                       weight: pokemon_entry.weight, base_experience: pokemon_entry.base_experience,
                       is_default: pokemon_entry.is_default)

        ## update pokemons attributes

        pokemon_entry.types.each do |pokemon_type|
          type = Type.find_by(name: pokemon_type.type.name)

          Pokemon.find(pokemon.id).types.destroy_all # Clean HMBT records
          pokemon.pokemon_types.find_or_create_by(pokemon_id: pokemon, type_id: type.id)
        end
      end

      page += 1
      puts "page #{page}"
    end
  end
end
