# Introduction

This simple web server will perform unit conversion to SI units from their "widely used" counterparts.  It has a
single method to convert units and it returns a JSON structure.

* Method: **GET**
* Path: **/units/si**
* Query parameter: **units** - A string containing any number of SI units multiplied or divided, which might
contain parenthesis. Examples: "degree", "degree/minute", "(degree/(minute*hectare))", "ha*°"

It doesn't have much in the way of error checking or handling, so if the URL is miss-formed or the calculation cannot
be completed, the error it generates is rather raw and unsightly.  There are some simple ways to pretty this up but
I didn't feel like that was part of the homework and would just add additional complexity.

## Requirements

* A relatively up-to-date version of Ruby (2.3.1)
* A relatively up-to-date version of the Bundler gem (1.16.1)

## Installation

1) Clone the repository: ```git clone git@github.com:rnhurt/citrine.io.git```
1) Change to the Citrine.io directory: ```cd citrine.io```
1) Install the necessary gems: ```bundle install```

## Execution

1) Run the web server: ```bundle exec ruby main.rb```
1) Run your tests against localhost on port 4567
    * http://localhost:4567/units/si?units=ha*degree
    * http://localhost:4567/units/si?units=degree/minute
    * http://localhost:4567/units/si?units=(degree/(minute*hectare))
