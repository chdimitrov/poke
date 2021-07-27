class BaseService
  def parse(resource_name, page = 1)
    PokeApi.get("#{resource_name}": {limit: 100, page: page})
  end
end