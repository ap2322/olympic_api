# Olympics API

The primary purpose of this API is to return data and analysis from the 2016 Summer Olympic Games. The future of this API will be to integrate the historical data from 2016 with a 2020 Summer Olympics Tracker App.

# Contents
- Deployment
- Technologies Used
- Installation and Local Deployment
- Using the Olympics API
- Rake Tasks
  - import:all
- Process
- Challenges
- Tradeoffs
- Future Features

# Rake Tasks

To facilitate importing historical data, specifically from the 2016 Summer Games, look at the import rake tasks built within this api.

### `import:all`

This task calls in order the following tasks: `import:olympians`, `import:events`, and `import:olympian_events` found in `lib/tasks/import_2016_data.rake` to populate the database with data from the csv file `db/2016_summer_olympic_data.csv`

```
rake import:all
```

To run in testing, use `rake import:all RAILS_ENV=test`
