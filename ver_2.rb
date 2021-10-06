### Initial Build on 23 Jan 2021, refer ver_1.rb
### Revised on 27 Sep 2021
### Using Ruby version ruby 3.0.0

# required libraries
require 'time'

# to keep track of all drivers we initialize hash..
# the key will be name of the driver and its value will be its trip details
driver_trips = Hash.new()

# asking user for no. of driver entries
puts "How many drivers' details will you enter?"
n = gets.chomp.to_i

# ask driver details
puts "Enter name of a drivers in the form 'Driver (name)':"

# will take input of driver details
n.times do
  # takes first 2 input words
  key, d_name = gets.chomp.split()

  # driver input validation
  abort "Invalid driver entry" if key != "Driver" ||
                                  # should not be any other class than string
                                  d_name.class != String

  # saving driver name and its value as an empty hash..
  # trip details will be stored in that hash
  driver_trips.store(d_name, {})
end

#p driver_trips


# ------------------------Trip Details------------------------ #


# asking no. of trip entries user will enter
puts "How many trip details will you enter?"
n = gets.chomp.to_i

# ask trip details
puts "Enter trip details as 'Trip (driver name)..':"

n.times do
  # since each data is is separated by a space in input..
  key, d_name, start, finish, m = gets.chomp.split()

  # trip validation #1 -- Time
  begin
    start = Time.parse(start)
    finish = Time.parse(finish)
  rescue
    # if time is in wrong form
    puts "Invalid Time input."
    next
  end

  # trip key validation #2
  if  key != "Trip" || m.to_f == 0.0
    puts "Incorrect keywords typed.\n"
    # asks user for next entry
    next
  end

  # now we save the input data to our existing driver has as its value
  # checks if driver exists in our list
  if driver = driver_trips.fetch(d_name)
    # we calculate the time he/she traveled
    travel_time = finish - start

    # since each drivers can have multiple entries given..
    # .. we want avoid to override the values..
    # ..so we check if the value exists of that key
    if driver.values.empty?
      # we add values by making respective keys
      driver.store(:travel_time, travel_time)
      driver.store(:miles_driven, m.to_f.round())

    else
      # if value already exists, we add new value to existing ones
      driver[:travel_time] += travel_time
      driver[:miles_driven] += m.to_f.round()
    end
  else
    # outputs for trip details for which driver doesn't exist
    puts "Driver doesn't exist!"
  end

end

#p driver_trips


# ------------------Calculating Speed---------------------- #

driver_trips.each do | driver, trips |
  driver = driver_trips.fetch(driver)

  # will not run for the drivers whos trip details arent provided
  unless trips.empty?
    # since we want to calculate in mph, we will need in time in hours too..
    # ..but there will be trips where a driver doesn't drive for atleast an hour..
    # .. so to calculate speed regardless of how long he/she drives, we come up with this formula
    multiplier =  3600 / trips[:travel_time]
    # will save the speed value in hash rounding to nearest integer
    driver.store(:speed,  (trips[:miles_driven] * multiplier).round())
  end
end

#p driver_trips

# ------------------Sort---------------------- #

# new hash
miles_driven = Hash.new

driver_trips.each do |k, v|
  # whose trip details are missing
  if v.empty?
    # we give their value as 0 and store in new hash
    miles_driven.store(k, 0)
  else
    miles_driven.store(k, v.fetch(:miles_driven))
  end
end

#p miles_driven
#
# this will sort the values of keys in descending order and return as a hash
miles_driven = miles_driven.sort_by { | k, v | [-v, k] }.to_h
p miles_driven


# -----------------Output----------------------#

miles_driven.each do |k, v|
  if v == 0
    puts "#{k}: #{v} miles."
  else
    puts "#{k}: #{v} miles @ #{driver_trips.fetch(k)[:speed]} mph."
  end
end

