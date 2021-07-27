namespace :poke do
  desc "Import data by consuming the Poke API"
  task import_data: :environment do
    page = 1

    while pokemons_response = PokemonService.new.parse_list(page).results
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
          if type = Type.find_by(pokemon: pokemon, name: pokemon_type.type.name)
            ## Update
            type.update(name: pokemon_type.type.name, slot: pokemon_type.slot)
          else
            ## Create
            Type.create(pokemon: pokemon, name: pokemon_type.type.name, slot: pokemon_type.slot)
          end
        end
      end

      page += 1
      puts "page #{page}"
    end
  end

end

# rake -T | grep poke
