# frozen_string_literal: true

class TypeService < BaseService
  def parse_list(page = 1)
    parse('type', page)
  end

  def parse_item(poke_api_object)
    poke_api_object.get
  end
end
