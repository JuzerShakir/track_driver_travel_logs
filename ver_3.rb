require 'time'

# * take the input file and extract data
data = File.open("input.txt").readlines.map(&:chomp)

# * Separates data of drivers and trips
def set_driver_trips(data)
    @drivers = data.select{ |d| d.start_with?("Driver") }
                    .map{ |driver| driver.split.at(1).downcase }
    @trips = data.select{ |d| d.start_with?("Trip") }
end
set_driver_trips(data)
# p @trips, @drivers

# * create instance vars with driver names having empty hash values with keys such as name, miles_driven, speed & time_traveled
def set_instance_values(name, md, s, tt)
    instance_variable_set("@#{name}",
        { name: "#{name}".capitalize, miles_driven: md, speed: s, time_traveled: tt })
end
@drivers.each { |driver| set_instance_values(driver, 0, 0, 0) }
# p @terence, @alma

# * returns string time to Time format
def set_time(times)
    times.map { |time| Time.parse(time) }
end

# * calculates time traveled
def time_traveled(times)
    start_time, end_time = set_time(times)
    ((end_time - start_time) / 60) /60
end

# * updates driver logs data from the trip details
def update_driver_logs(*args)
    _, name, start_time, end_time, miles_driven = args

    name.downcase!

    if instance_variable_defined?("@#{name}")
        current_driver = instance_variable_get("@#{name}")

        total_miles_driven = current_driver[:miles_driven] + miles_driven.to_f
        total_time_traveled = current_driver[:time_traveled] + time_traveled([start_time, end_time])
        total_speed = (total_miles_driven / total_time_traveled).round

        set_instance_values(name, total_miles_driven.round, total_speed, total_time_traveled)
    end
end
for trip in @trips do
    update_driver_logs(*trip.split)
end
# p @terence, @alma, @adam

# * sorts data descendingly based on miles driven
def sort_drivers(drivers)
    drivers.map { |driver| instance_variable_get("@#{driver}") }
            .sort_by { |driver| -driver[:miles_driven] }
end
most_miles_driven = sort_drivers(@drivers)
# p most_miles_driven

# * ouputs the result
def output(most_miles_driven)
    most_miles_driven.each { |driver|
        output = ""
        output << "#{driver[:name]}: #{driver[:miles_driven]} miles"
        output << " @ #{driver[:speed]} mph" if driver[:speed].between?(5, 100)
        puts output
    }
end
output(most_miles_driven)