# Introduction

This simple web server will perform unit conversion to SI units from
their "widely used" counterparts.  It has a single method to convert units
and it returns a JSON structure.

* Method: **GET**
* Path: **/units/si**
* Query parameter: **units** - A string containing any number of SI units multiplied or divided, which might contain parenthesis. Examples: "degree", "degree/minute", "(degree/(minute*hectare))", "ha*°"

## Requirements

* A relatively up-to-date version of Ruby (2.3.1)
* A relatively up-to-date version of the Bundler gem (1.16.1)

## Installation

1) Clone the repository: ```git clone git@github.com:rnhurt/citrine.io.git```
2) Install the necessary gems: ```bundle install```

## Execution

1) Run the web server: ```bundle exec ruby main.rb```
2) Run your tests against the URL: http://localhost:4567
