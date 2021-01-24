######### Build on 23 Jan 2021
=begin

write some code to track driving history for people.

Each line in the input file will start with a command. There are two
possible commands.

The first command is Driver, which will register a new Driver.
Example:

`Driver Terence`

The second command is Trip, which will record a trip attributed to a
driver.
The line will be space delimited with the following fields:
the command (Trip), driver name, start time, stop time, miles driven.
Times will be given in the format of hours:minutes. We'll use a
24-hour clock and will assume that drivers never drive past midnight
(the start time will always be before the end time).

Example:
`Trip Terence 07:15 07:45 17.3`

Discard any trips that average a speed of less than 5 mph or greater
than 100 mph.

Generate a report containing each driver with total miles driven and
average speed. Sort the output by most miles driven to least. Round
miles and miles per hour to the nearest integer.

Example input:

Driver Terence
Driver Alma
Driver Adam
Trip Terence 07:15 07:45 17.3
Trip Terence 06:12 06:32 21.8
Trip Alma 12:01 13:16 42.0


Expected output:

Alma: 42 miles @ 34 mph
Terence : 39 miles @ 47 mph
Adam: 0 miles

=end
def track_driver trip_info
  # this hash will hold answers to our problem
  output = Hash.new

  # looping through hash, will perform calculation on each driver
  trip_info.each do |key, value|

    # will hold driver details on calculation performed in each loop
    output_val = []

    # if driver was registered and his trip details weren't entered..
    # .. then we skip calculations for this driver
    if value == 0
      # driver will now be saved in our new hash
      # the key of this hash will not be driver name but miles driven..
      # ..since we have sort it through that value in our output
      output[value] = key
      next
    end

    # giving float values for calculations, miles driven for all trips of each driver
    miles_driven = 0.0
    # will hold total trip duration value, useful for multiple entries
    time = 0.0

    # multiple trip entries of single driver will have different length
    # but we know that each trip of a driver will have 3 details to it
    # so if we have 2 trip details of single driver, we will have..
    # ..6 elements in the value list of that driver key
    len = value.length
    # so we divide each entry by 3 so we get details of single trip of..
    # ..that driver and perform independent calculation on it
    trip_entry = len / 3

    # looping through each trip of a driver
    while trip_entry != 0
      # the first and second element of list contains Time data
      # since we want to know duration of trip, we substract & get sec
      secs = value[1] - value[0]
      # each hour has 3600 sec
      hour = secs / 3600
      # new time will be added to previous time (for multiple entries)
      time += hour
      # new miles value will be added to previous miles
      miles_driven += value[2]
      # after performing calc on this trip we know longer require those values..
      # ...and also this makes easy for performing calculations on next trip
      value.slice!(0..2)

      trip_entry -= 1
    end

    # calculating speed by distance/time
    speed = miles_driven / time

    # as given in description, we exclude drivers and re-run loop
    if speed < 5 || speed > 100 then next end

    # driver name appends
    output_val << key
    # speed appends, rounding to nearest deimal place
    output_val << speed.round(0)
    # rounding to nearest deimal place
    miles_driven = miles_driven.round(0)

    # now since miles driven by a driver in all trips will be key
    # and its value will be name and speed, list
    output[miles_driven] = output_val

  end
  # since we cant sort hashes and we want to sort them by keys
  # we extract keys and append them to list
  key_list = output.keys
  # sort the keys in descending order because we want output in that form
  key_list = key_list.sort.reverse

  # loop through list of keys
  key_list.each do | k |
    # extarct hash values with respect to that key
    value = output[k]

    # a driver whose trip details weren't entered
    if k == 0
      puts "#{value} #{k} miles."
    else
      # our final output extracting appropraite values from hash
      puts "#{value[0]}: #{k} miles @ #{value[1]} mph."
    end

  end

end

# this hash will store trip details of people
trip_info = Hash.new

# asks user for input
puts "Enter name of a driver, input expected as 'Driver name'"
puts "Expecting only 1 driver name in each entry."
puts "Press enter to register entry, press enter again to exit registering driver names."
puts "\n"
# since we dont know how many user inputs there will be, we will use loop..
# .. to save each entry
loop do
  # stores user input as an array and caps first letter of each element
  driver_name = gets.chomp.split(' ').map(&:capitalize)
  # necessory for exiting from this loop
  if driver_name.empty? then break end

  # checks if user entry is as expected
  if driver_name[0] != "Driver"
    puts "Please Enter appropriate input!"
    # if entry is wrong, will start loop again
    next
  end

  # after checking user input is right, we store the name of driver..
  # .. as a key to our hash and giving default value of 0
  trip_info[driver_name[1]] = 0
end

# NO DRIVER? we dont expect entry for fully self-driving cars ;)
if trip_info.empty? then abort "Atleast 1 driver entry expected." else p trip_info end
puts "\n"

# now having names of drivers registered we will now ask their trip details..
puts "Now enter trip info of the driver names you entered."
puts "Enter trip info in this form 'Trip driver-name start-time stop-time miles-driven.'"
puts "Format of time will be as hours:mins and use 24 hour clock."
puts "Press enter to register entry, press enter again to exit registering trip details."
puts "\n"

# needed for converting string input of time as Time
require 'time'

# since we dont know how many enteries user will enter, we use loop
loop do
  # input string converted to an array
  trip = gets.chomp.split(' ')
  # necessory for exiting registering trip details
  if trip.empty? then break end

  # checks if input is appropriate
  if trip[0] != "Trip"
    puts "Please Enter appropriate input!\n"
    # wrong input will re-ask user for input
    next
  end

  # checks if driver name entered in trip details exist in our registered driver names
  # .. and also checks if the details entered are of correct length
  if trip_info.include?(trip[1]) && trip.length == 5

    # 3rd and 4th element of input contains time, lets convert
    # ..but we need to make sure that user entry entered is indeed proper time format
    begin
      # checks if user entry is convertible to time format
      trip[2] = Time.parse(trip[2])
      trip[3] = Time.parse(trip[3])
    # if not a custom exception is run in terminal
    rescue
      # prints error
      puts $!
      puts "Please input proper time information! Input a 24 hour time format HH:MM."
      puts "Re-enter the trip details: "
      puts "\n"
      # re runs the loop asking to enter details again
      next
    end

    # this element contains miles driven so converting to float
    trip[4] = trip[4].to_f

    # since we can take multiple entries of single driver, we need to ..
    # .. confirm if we have already given trip details to that driver
    if trip_info[trip[1]] == 0
      # if this driver had no details previously input, we give it
      # since we dont want the first 2 elements of the input, we extract remaining
      # a list will be saved for that driver which is a key
      trip_info[trip[1]] = trip[2..4]
    else
      # if driver already has previous data in it, we append new data
      trip_info[trip[1]] << trip[2..4]
      # since we are saving value of key as list, multiple entries of..
      # ..single driver makes hash have values as nested list..
      # ..we get rid of nested list of hash by flatten
      trip_info[trip[1]] = trip_info[trip[1]].flatten
    end
  # if driver entered here isnt in our driver registery OR..
  # ..input isnt appropraite we re-ask for input
  else
    puts "Driver NOT found OR Entered UNEXPECTED number of inputs!"
    puts "\n"
    next
  end

end

# calls function
track_driver(trip_info)
