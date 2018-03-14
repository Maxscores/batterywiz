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

### Schema
![Schema](https://raw.githubusercontent.com/maxscores/batterywiz/master/db/schema.png)

## Authors

* **Max Stackhouse** - *Initial work* - [Maxscores](https://github.com/Maxscores)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to NREL for the great APIs
* Thanks to Ben Marum for solar expertise
