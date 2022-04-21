# README
ffffffff
## Description
Data importing by consuming third party API, store it in DB and serve the data over JSON REST API

## Installation
```shell
bundle install
```

```shell
rake db:craete db:migrate
```

## Start project
```shell
bundle exec rails s -p <your_desired_port_number>
```

## How to update Pokemon list
List project specific tasks
```shell
rake -T | grep poke
```

Update list
```shell
rake poke:import_data
```

## How to consume the API

```shell
curl <hostname>/pokemons
```
```shell
curl <hostname>/pokemons/:id
```

## Heroku demo
- link https://calm-beach-74048.herokuapp.com/pokemons
