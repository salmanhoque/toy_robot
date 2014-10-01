require File.expand_path('lib/Robot.rb')

describe "#RobotClass:" do 
  
  describe "Initilize the robot class" do
    before :each do
      @a = Robot.new(0,0,"EAST")
    end

    context "It is a Robot instance" do
      it { expect(@a).to be_an_instance_of Robot }
    end

    context "Response to the arrtibutes" do
      it { expect(@a).to respond_to :x, :y, :f}
    end

    context "After initilization able get arrtibutes value" do
      it { expect(@a.x).to eq(0)}
    end

    context "Able to report current state" do
      it {
        expect { @a.report }.to output("Output: 0,0,EAST\n").to_stdout
      }
    end
  end

  describe "Initilization using invalid parameter" do
    context "Where x is negative" do
      it {
        expect { Robot.new(-1,0,"EAST") }.to output("Invalid Input\n").to_stdout
      }
    end

    context "Where y is negative" do
      it {
        expect { Robot.new(1,-1,"EAST") }.to output("Invalid Input\n").to_stdout
      }
    end

    context "Where x and y is more than 5 unit" do
      it {
        expect { Robot.new(7,5,"EAST") }.to output("Invalid Input\n").to_stdout
      }
    end
  end

  describe "Move method:" do
    before :each do
      @a = Robot.new(0,4,"NORTH")
      @a.move
    end

    context "When valid robot moves one unit" do
      it {
        expect { @a.report }.to output("Output: 0,5,NORTH\n").to_stdout
      }
    end

    context "When valid robot moves one unit" do
      it {
        expect { @a.move }.to output("Can not move further NORTH\n").to_stdout
      }
    end
  end

  describe "Rotate method:" do
    before :each do
      @a = Robot.new(0,4,"NORTH")
    end

    context "LEFT will rotate NORTH facing robot to WEST" do
      it {
        @a.rotate(:LEFT)
        expect { @a.report }.to output("Output: 0,4,WEST\n").to_stdout
      }
    end

    context "RIGHT will rotate NORTH facing robot to EAST" do
      it {
        @a.rotate(:RIGHT)
        expect { @a.report }.to output("Output: 0,4,EAST\n").to_stdout
      }
    end
  end

  describe "Robot move test:" do
    before :each do
      @a = Robot.new(0,4,"NORTH")
    end

    context "Move one unit then turn Left and move one unit again" do
      it { 
        @a.move
        @a.rotate(:LEFT)
        expect { @a.move }.to output("Can not move further WEST\n").to_stdout
      }
    end

    context "Move one unit then turn Right and move one unit again" do
      it { 
        @a.move
        @a.rotate(:RIGHT)
        @a.move
        expect { @a.report }.to output("Output: 1,5,EAST\n").to_stdout
      }
    end

    context "Move one unit then turn Right twice and move one unit again" do
      it { 
        @a.move
        @a.rotate(:RIGHT)
        @a.rotate(:RIGHT)
        @a.move
        expect { @a.report }.to output("Output: 0,4,SOUTH\n").to_stdout
      }
    end
  end

end