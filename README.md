# Battery Wiz

[![Coverage Status](https://coveralls.io/repos/github/Maxscores/solar_calc/badge.svg?branch=master)](https://coveralls.io/github/Maxscores/solar_calc?branch=master)
[![Build Status](https://travis-ci.org/Maxscores/batterywiz.svg?branch=master)](https://travis-ci.org/Maxscores/batterywiz)
[![Maintainability](https://api.codeclimate.com/v1/badges/3788262618972b66641f/maintainability)](https://codeclimate.com/github/Maxscores/solar_calc/maintainability)

[Battery Wiz](https://batterywiz.herokuapp.com) is an application that can be used to estimate solar array specifications based on your monthly consumption and location. In addition to calculating the required solar capacity for the project, [Battery Wiz](https://batterywiz.herokuapp.com) calculates the capacity of a battery required to power consumption throughout the night.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have PostgreSQL, Rails, and Bundler installed on your machine

[How to install PostgreSQL](https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb)

Install Rails & Bundler:
```
$ gem install rails
$ gem install bundler
```

### Installing

Install Required Gems
```
$ bundle install
```

Setup Database
```
$ rake db:{create,migrate}
```

Boot Server and Visit [localhost:3000](https://localhost:3000)
```
$ rails server
```

## Running the tests

Testing was written using RSpec. To run the tests:
```
$ rspec
```

## Schema
![Schema](https://raw.githubusercontent.com/maxscores/batterywiz/master/db/schema.png)

## Application Flow

1. User visits homepage and can either sign in (to save information) or proceed to the calculator without signing in.
2. The first step of the calculator asks a user for their zipcode.
3. After submission an installation resource is created in the db with the zipcode and user_id (if signed in). A session is created with the current installation_id.
4. User is redirected to second step.
5. The second step of the calculator asks for their energy consumption for every month.
6. After submission a consumption resource is created to save their monthly consumption with the current installation_id from the session.
7. Before the user is redirected, we calculate the estiated minimum size of a solar array based on the location, their monthly consumption and raw monthly solar output data.
8. The user is redirected to the final step where they can specify the details of the solar array for the output calculations. The solar capacity comes pre-filled with the result from step 7, but can be changed.
9. The user hits submit and the details are captured in the solar system resource.
10. Before the solar system is saved two things happen: 
  1) An api call gets sent to the NREL PVWatts calculator to estimate total monthly output and hour by hour production for the entire year. That data gets captured in the production resource.
  2) The battery capacity is calculated by taking the monthly consumption and breaking it out to hour by hour consumption based on a standard profile. Then, compares that hourly consumption to hourly production and finds the total daily consumption when there is no solar production, where the maximum is the required battery capacity. These calculations are captured in the battery resource
11. The user is directed to a summary page with the installation details, CO2 offset, dollars saved and graphs of the energy production.

## Authors

* **Max Stackhouse** - *Initial work* - [Maxscores](https://github.com/Maxscores)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to NREL for the great APIs
* Thanks to Ben Marum for solar expertise
