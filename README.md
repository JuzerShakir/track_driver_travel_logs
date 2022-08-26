# Problem: Track Driver Travel Logs

<div align="center">
  <img src="assets/project_logo.png" />
</div>

### ❗ Problem Details

> Each line in the input file will start with a command. There are two
> possible commands.

> The first command is `Driver`, which will register a new Driver.
> Example: `Driver Terence`

> The second command is `Trip`, which will record a trip attributed to a
> driver.

> The line will be space delimited with the following fields:
> the command (Trip), driver name, start time, stop time, miles driven.
> Times will be given in the format of hours:minutes. We'll use a
> 24-hour clock and will assume that drivers never drive past midnight
> (the start time will always be before the end time).
> Example: `Trip Terence 07:15 07:45 17.3`

> Discard any trips that average a speed of less than 5 mph or greater
> than 100 mph.

> Generate a report containing each driver with total miles driven and
> average speed. Sort the output by most miles driven to least. Round
> miles and miles per hour to the nearest integer.

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

---

### ✔️ Solution Details

<img src="https://img.shields.io/badge/Ruby2-CC342D?style=for-the-badge&logo=ruby&logoColor=white" />
<img src="https://img.shields.io/badge/Ruby3-CC342D?style=for-the-badge&logo=ruby&logoColor=white" />

I have successfully solved this problem using ruby language and the solution can be found in `ver_1.rb`, `ver_2.rb` & `ver_3.rb` files.

- The initial solution I came up with is in the file `ver_1.rb`, where I have used combination of arrays & hashes to get to the appropriate solution. uses arrays extensively and is almost impossible to follow what the code does if comments don't exist. (~220 lines on 23rd Jan '21)

- In the `ver_2.rb`, I have used only hashes, leveraging the rich methods that ruby provides. It's understandable to most extent even for non-programmers. (~155 lines on 27 Sep '21)

- And in `ver_3.rb`, separated the input in a file `input.txt` as described in the problem and separated each functions in a different methods and is one of the best solutions. (~70 lines on 26 Aug '22)

All solution files achieve correct results but the main difference you will find is in the code.

Here's a short video where I demonstrate running solution files in terminal:

[![Video Thumbnail](assets/yt-thumbnail.png)](https://www.youtube.com/watch?v=QUsJcMB4z5E "Track Driver Travel Logs")

#### 💎 Libraries Used

- _time_

#### 📋 Local Execution

Clone this repo, navigate to the appropriate directory and run the following commands in Terminal:

```bash
ruby ver_1.rb
```

or

```bash
ruby ver_2.rb
```

or

```bash
ruby ver_3.rb
```

This will run the given code file. Enter appropriate input to get desired output.

---

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.track_driving_history&color=000000&lcolor=000000&style=for-the-badge&logo=Github)

<a href="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/11197700-002d-4cb2-896f-b964a2c28b60"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/11197700-002d-4cb2-896f-b964a2c28b60.svg" alt="wakatime"></a>
