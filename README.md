# Olympics API

The primary purpose of this API is to return data and analysis from the 2016 Summer Olympic Games. The future of this API will be to integrate the historical data from 2016 with a 2020 Summer Olympics Tracker App.

# Contents
- Deployment
- Technologies Used
- Installation and Local Deployment
- Using the Olympics API
  - Get Olympians `GET api/v1/olympians`
  - Get Olympians with Parameters
  - Get Olympian Statistics `GET api/v1/olympian_stats`
- Rake Tasks
  - import:all
- Process
- Challenges
- Tradeoffs
- Future Features

# Using the Olympics API

### Get Olympians `GET api/v1/olympians`

This endpoint retrieves all the olympians in the database and returns the collection as json with an array of `olympians`. Attributes for each olympian include: `name`, `team`, `age`, `sport`, and `total_medals_won`

Example request: `GET http://localhost:3000/api/v1/olympians`

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

### Get Olympians with Parameters `GET api/v1/olympians?age=<search_term>`

The `olympians` endpoint accepts a parameter of `age`. Valid `search_term`s include:
- `oldest`(returns the oldest olympian by age at competition)
- `youngest` (returns the youngest olympian by age at competition)

Example request: `GET http://localhost:3000/api/v1/olympians?age=youngest`

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

### Get Olympian Statistics `GET api/v1/olympian_stats`

The olympian statistics endpoint retrieves aggregate data about all the olympians in the database.

Example request: `GET http://localhost:3000/api/v1/olympian_stats`

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

# Rake Tasks

To facilitate importing historical data, specifically from the 2016 Summer Games, look at the import rake tasks built within this api.

### `import:all`

This task calls in order the following tasks: `import:olympians`, `import:events`, and `import:olympian_events` found in `lib/tasks/import_2016_data.rake` to populate the database with data from the csv file `db/2016_summer_olympic_data.csv`

```
rake import:all
```

To run in testing, use `rake import:all RAILS_ENV=test`
