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
  output = Hash.new

  trip_info.each do |key, value|

    output_val = []

    if value == 0
      output[value] = key
      next
    end

    miles_driven = 0.0
    time = 0.0

    len = value.length
    user_entry = len / 3

    while user_entry != 0
      secs = value[1] - value[0]
      hour = secs / 3600
      time += hour

      miles_driven += value[2]

      value.slice!(0..2)

      user_entry -= 1
    end

    speed = miles_driven / time

    if speed < 5 || speed > 100 then next end

    output_val << key
    output_val << speed.round(0)
    miles_driven = miles_driven.round(0)
    output[miles_driven] = output_val

  end

  key_list = output.keys
  key_list = key_list.sort.reverse

  key_list.each do | k |
    value = output[k]

    if k == 0
      puts "#{value} #{k} miles."
    else
      puts "#{value[0]}: #{k} miles @ #{value[1]} mph."
    end

  end

end

trip_info = Hash.new

puts "Enter name of a driver, input expected as 'Driver name'"
puts "Expecting only 1 driver name in each entry."
puts "Press enter to register entry, press enter again to exit entering driver names."
loop do
  driver_name = gets.chomp.split(' ')
  if driver_name.empty? then break end

  if driver_name[0] != "Driver"
    puts "Please Enter appropriate input!"
    next
  end

  trip_info[driver_name[1]] = 0
end

if trip_info.empty? then abort "Atleast one driver entry expected." else p trip_info end


puts "Now enter trip info of the drivers name you entered: "
puts "Enter trip info in this form 'Trip driver-name start-time stop-time miles-driven.'"
puts "Format of time will be as hours:mins and use 24 hour clock."
puts "Press enter to register entry, press enter again to exit entering trip details."
require 'time'
loop do
  trip = gets.chomp.split(' ')
  if trip.empty? then break end

  if trip[0] != "Trip"
    puts "Please Enter appropriate input!"
    next
  end

  if trip_info.include?(trip[1]) && trip.length == 5

    trip[2] = Time.parse(trip[2])
    trip[3] = Time.parse(trip[3])
    trip[4] = trip[4].to_f

    if trip_info[trip[1]] == 0
      trip_info[trip[1]] = trip[2..4]
    else
      trip_info[trip[1]] << trip[2..4]
      trip_info[trip[1]] = trip_info[trip[1]].flatten
    end
  else
    puts "Driver NOT found OR Entered UNEXPECTED number of inputs!"
    next
  end

end

#p trip_info

track_driver(trip_info)
