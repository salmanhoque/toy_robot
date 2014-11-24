[![Build Status](https://api.shippable.com/projects/546ff16dd46935d5fbbe4991/badge?branchName=master)](https://app.shippable.com/projects/546ff16dd46935d5fbbe4991/builds/latest)

#Toy Robot Simulator

###Application Directory Structure

```
/toy_robot
|--- /lib (Class files)
|		|--- Interface.rb (Robot commnad line interface)
|		|--- Robot.rb 	 (Robot and it's controller)
|--- /spec (Rspec test files)
|		|--- interface_spec.rb (interface class spec)
|		|--- robot_spec.rb (robot class spec)
|--- play.rb (start application)
``` 

### Start Application
Ruby version 2.0.0p247. From command line run  `ruby play.rb`

### Test Application  

Rspec version 3.1.0. From command line run `rpsec spec/`

### Test Data
```
> PLACE 0,0,SOUTH
> MOVE
Can not move further SOUTH
```

```
> PLACE -1,5,NORTH
Invalid Input
```

```
> PLACE 0,0,EAST
> MOVE
> LEFT
> MOVE
> REPORT
Output: 1,1,NORTH
```