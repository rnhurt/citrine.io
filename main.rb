require 'sinatra'
require 'dentaku'
require 'json'

# Main loop
get '/units/si' do
  content_type :json
  units = params[:units]
  output = {}

  output[:unit_name] = convert(units)
  output[:multiplication_factor] = calculate(units)

  return output.to_json
end


# Convert the units to their SI equivalents
def convert(input)
  # Time
  input = input.gsub(/(minute\b|min\b|hour\b|h\b|day\b|d\b)/, 's')

  # Plane angle
  input = input.gsub(/(degree\b|second\b|°|'|")/, 'rad')

  # Area / Volume / Mass
  input = input.gsub(/(hectare\b|ha\b)/, 'm^2')
  input = input.gsub(/(litre\b|L\b)/, 'm^3')
  input = input.gsub(/(tonne\b|t\b)/, 'kg')

  return input
end


# Calculate the multiplication factor
def calculate(input)
  # Time
  input = input.gsub(/(minute\b|min\b)/, '60')
  input = input.gsub(/(hour\b|h\b)/, '3600')
  input = input.gsub(/(day\b|d\b)/, '86400')

  # Plane angle
  input = input.gsub(/(degree\b|°)/, '(3.141592653589793 / 180)')
  input = input.gsub(/'/,            '(3.141592653589793 / 10800)')
  input = input.gsub(/(second\b|")/, '(3.141592653589793 / 648000)')

  # Area / Volume / Mass
  input = input.gsub(/(hectare\b|ha\b)/, '10000')
  input = input.gsub(/(litre\b|L\b)/, '0.001')
  input = input.gsub(/(tonne\b|t\b)/, '10')

  # Round the output to 14 decimal places
  return sprintf("%.14f", Dentaku(input))
end

