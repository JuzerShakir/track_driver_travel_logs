Write some code to track driving history for people.

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
