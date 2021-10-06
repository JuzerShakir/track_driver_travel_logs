# Problem: Drivers' Travel Log

### 📝 Problem Details

Each line in the input file will start with a command. There are two
possible commands.<br/>

The first command is `Driver`, which will register a new Driver.<br/>
Example: `Driver Terence`

<br/>

The second command is `Trip`, which will record a trip attributed to a
driver.
<br/>
The line will be space delimited with the following fields:
the command (Trip), driver name, start time, stop time, miles driven.
Times will be given in the format of hours:minutes. We'll use a
24-hour clock and will assume that drivers never drive past midnight
(the start time will always be before the end time).<br/>
Example: `Trip Terence 07:15 07:45 17.3`

<br/>

Discard any trips that average a speed of less than 5 mph or greater
than 100 mph.

<br/>

Generate a report containing each driver with total miles driven and
average speed. Sort the output by most miles driven to least. Round
miles and miles per hour to the nearest integer.


#### ⌨️ Example input:
```bash
Driver Terence
Driver Alma
Driver Adam
Trip Terence 07:15 07:45 17.3
Trip Terence 06:12 06:32 21.8
Trip Alma 12:01 13:16 42.0
```

#### 💻 Expected output:
```bash
Alma: 42 miles @ 34 mph
Terence : 39 miles @ 47 mph
Adam: 0 miles
```

----

**This project was solved using <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" /> with version `2.7.2p137` in `ver_1.rb` file & `3.0.0` in `ver_2.rb` file.**

----


### 💎 Libraries Used
 - _time_

---

### 📋 Local Execution

Clone this repo, navigate to the appropraite directory and run the following commands in Terminal:

```bash
ruby ver_1.rb
```
or

```bash
ruby ver_2.rb
```

This will run the respective code file. Enter appropraite input to get desired output.

----

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.track_driving_history&color=000000&lcolor=000000&style=for-the-badge&logo=Github)


<a href="https://wakatime.com/badge/github/JuzerShakir/track_driving_history"><img src="https://wakatime.com/badge/github/JuzerShakir/track_driving_history.svg" alt="wakatime"></a>


