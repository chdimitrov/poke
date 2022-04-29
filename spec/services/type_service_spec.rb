# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypeService do
  subject { described_class.new.parse_list }
  # rubocop:disable Layout/LineLength
  let(:body_response) { '{"count":20,"next_url":null,"previous_url":null,"results":[{"name":"normal","url":"https://pokeapi.co/api/v2/type/1/"},{"name":"fighting","url":"https://pokeapi.co/api/v2/type/2/"},{"name":"flying","url":"https://pokeapi.co/api/v2/type/3/"},{"name":"poison","url":"https://pokeapi.co/api/v2/type/4/"},{"name":"ground","url":"https://pokeapi.co/api/v2/type/5/"},{"name":"rock","url":"https://pokeapi.co/api/v2/type/6/"},{"name":"bug","url":"https://pokeapi.co/api/v2/type/7/"},{"name":"ghost","url":"https://pokeapi.co/api/v2/type/8/"},{"name":"steel","url":"https://pokeapi.co/api/v2/type/9/"},{"name":"fire","url":"https://pokeapi.co/api/v2/type/10/"},{"name":"water","url":"https://pokeapi.co/api/v2/type/11/"},{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"},{"name":"electric","url":"https://pokeapi.co/api/v2/type/13/"},{"name":"psychic","url":"https://pokeapi.co/api/v2/type/14/"},{"name":"ice","url":"https://pokeapi.co/api/v2/type/15/"},{"name":"dragon","url":"https://pokeapi.co/api/v2/type/16/"},{"name":"dark","url":"https://pokeapi.co/api/v2/type/17/"},{"name":"fairy","url":"https://pokeapi.co/api/v2/type/18/"},{"name":"unknown","url":"https://pokeapi.co/api/v2/type/10001/"},{"name":"shadow","url":"https://pokeapi.co/api/v2/type/10002/"}]}' }
  # rubocop:enable Layout/LineLength
  it 'returns data' do
    stub_request(:get, 'https://pokeapi.co/api/v2/type/?limit=100&offset=0')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'pokeapi.co',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: body_response, headers: {})

    expect(subject.results).to be_a Array
    expect(subject.results.first).to respond_to(:name)
  end
end
