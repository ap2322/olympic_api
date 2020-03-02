# Olympics API

The primary purpose of this API is to return data and analysis from the 2016 Summer Olympic Games. The future of this API will be to integrate the historical data from 2016 with a 2020 Summer Olympics Tracker App.

# Contents
- [Schema](#schema)
- [Deployment](#deployment)
- [Technologies Used](#technologies-used)
- [Installation and Local Deployment](#installation-and-local-deployment)
- [Using the Olympics API](#using-the-olympics-api)
  - Get Olympians `GET api/v1/olympians`
  - Get Olympians with Parameters
  - Get Olympian Statistics `GET api/v1/olympian_stats`
- [Rake Tasks](#rake-tasks)
  - import:all


## Schema

<img width="750" alt="schema diagram" src="https://user-images.githubusercontent.com/26877629/75621273-47996280-5b4f-11ea-8c63-0b0e48c242fd.png">

## Deployment

This api and sample data from the 2016 Summer Olympic Games is available at `https://ap-olympic-api.herokuapp.com/`.


## Technologies Used

- Ruby v2.6.3
- Rails v5.2.4.1
- Postgres v11.5
- Testing Suite: Rspec, Shoulda-Matchers
- CI with GitHub Actions


## Installation and Local Deployment

- `git clone` this repo and migrate into the directory before running `bundle install`
- Set up and seed the local development and test databases with the following commands:
```
rails db:{create,migrate}
rails db:migrate RAILS_ENV=test
rake import:all
rake import:all RAILS_ENV=test
```
- Check tests are passing locally with `bundle exec rspec`
- Deploy to localhost with `rails s`


## Using the Olympics API

All of these endpoints are hosted at `https://ap-olympic-api.herokuapp.com/`. Prepend this url to the endpoints below to query in production. If running locally, use `http://localhost:3000/`.

#### Get Olympians `GET api/v1/olympians`

This endpoint retrieves all the olympians in the database and returns the collection as json with an array of `olympians`. Attributes for each olympian include: `name`, `team`, `age`, `sport`, and `total_medals_won`

Example request: `GET https://ap-olympic-api.herokuapp.com/api/v1/olympians`

Example response:
```
HTTP 1.1 200 OK
Content-Type: application/json

{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

#### Get Olympians with Parameters `GET api/v1/olympians?age=<search_term>`

The `olympians` endpoint accepts a parameter of `age`. Valid `search_term`s include:
- `oldest`(returns the oldest olympian by age at competition)
- `youngest` (returns the youngest olympian by age at competition)

Example request: `GET https://ap-olympic-api.herokuapp.com/api/v1/olympians?age=youngest`

Example response:
```
HTTP 1.1 200 OK
Content-Type: application/json

{
  "olympians":
    [
      {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming"
        "total_medals_won": 0
      }
    ]

}
```

#### Get Olympian Statistics `GET api/v1/olympian_stats`

The olympian statistics endpoint retrieves aggregate data about all the olympians in the database.

Example request: `GET https://ap-olympic-api.herokuapp.com/api/v1/olympian_stats`

Example response:
```
HTTP 1.1 200 OK
Content-Type: application/json

{
    "olympian_stats": {
        "total_competing_olympians": 2850,
        "average_weight": {
            "unit": "kg",
            "male_olympians": 77.9,
            "female_olympians": 61.4
        },
        "average_age": 26
    }
}
```

#### Get Events `GET api/v1/events`

This endpoint retrieves all the events in the database and returns the collection as json with an array of `events`. Attributes for each event includes: `sport` and `events` where `events` lists all the names of the events for that `sport`.

Example request: `GET https://ap-olympic-api.herokuapp.com/api/v1/events`

Example response:
```
HTTP 1.1 200 OK
Content-Type: application/json

{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

#### Get Medalists `GET api/v1/events/:id/medalists`

This endpoint retrieves the olympians who medaled in the specified event with `:id`. The json response returns the `event` name and an array of `medalists` with attributes of `name`, `team`, `age`, and `medal`.

Not every event will have medalists listed in the current database. *Data is a sample set as of March 2020*

Example request: `GET https://ap-olympic-api.herokuapp.com/api/v1/events/9/medalists`
```
HTTP 1.1 200 OK
Content-Type: application/json

{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```

## Rake Tasks

To facilitate importing historical data, specifically from the 2016 Summer Games, look at the import rake tasks built within this api.

#### `import:all`

This task calls in order the following tasks: `import:olympians`, `import:events`, and `import:olympian_events` found in `lib/tasks/import_2016_data.rake` to populate the database with data from the csv file `db/2016_summer_olympic_data.csv`

```
rake import:all
```

To run in testing, use `rake import:all RAILS_ENV=test`
