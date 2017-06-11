#Toy Robot Simulator

###Application Directory Structure

```
/toy_robot
|--- /lib (Class files)
|		|--- action.rb (Controller to parse and handle user actions) 
|		|--- board.rb (Builds board for robot to move)
|   |--- interface.rb (Commnad line interface)
|   |--- invalid_move_error.rb (StandardError class)
|   |--- robot.rb (Robot and it's logic to move and rotate)
|--- play.rb (Start application)
|--- loader.rb (Loads files in lib dir)
``` 

### Start Application
Ruby version 2.0.0p247. From command line run  `ruby play.rb`

### Test Application  

Rspec version 3.1.0. From command line run `rpsec spec/`

### CLI Controls/Commands:
|   |   |
|---|---|
| board 5 7 | This will generate a board with 5x and 7y unit |
| place X, Y, F | This command will place the robot on a table where X, Y should be in between 0 and x/y asix unit and F could be north, south, east or west|
| move | This command will move the robot one unit forward |
| left or right | Rotate robot face left or right |
| report | Print out robot's current position |
| help | To see help message |
| exit | Exit from this simulator |

### Test Data
```
> place 0 0 south
> move
Can not move further SOUTH
```

```
> place -1 5 north
Woops: you just drop that robot from the table!
```

```
> place 0 0 east
> move
> left
> move
> report
Current Position: 1, 1, NORTH
```