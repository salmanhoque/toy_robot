require File.expand_path('lib/Interface.rb')

describe "#InterfaceClass:" do 
  
  describe "Initilize the robot interface" do
    context "It is a Robot instance" do
      it { expect(Interface.new).to be_an_instance_of Interface }
    end
  end

  describe "Launch method:" do
    before :each do
      @a = Interface.new()
    end

    context "Able to show welcome message" do
      it { 
        expect{@a.welcomeMessage}.to \
          output(/Welcome To Toy Robot Simulator/).to_stdout
      }
    end
  end

  describe "Action Method:" do
    before :each do
      @a = Interface.new()
    end

    context "When user input: PLACE 1,1,NORTH then REPORT" do
      it{
        @a.actions("PLACE",["1,1,NORTH"])
        expect{@a.actions("REPORT",[])}.to \
          output("Output: 1,1,NORTH\n").to_stdout
      }
    end

    context "When invalid user input: PLACE " do
      it{
        expect{@a.actions("PLACE",[])}.to \
          output("Invalid Input\n").to_stdout
      }
    end

    context "When invalid user input: PLACE 0,0" do
      it{
        expect{@a.actions("PLACE",["0,0"])}.to \
          output("Invalid Input\n").to_stdout
      }
    end

    context "When invalid user input: PLACE NORTH,0,0" do
      it{
        expect{@a.actions("PLACE",["NORTH,0,0"])}.to \
          output("Invalid Input\n").to_stdout
      }
    end

    context "When invalid user input: PLACE -1,-2,NORTH" do
      it{
        expect{@a.actions("PLACE",["-1,-2,NORTH"])}.to \
          output("Invalid Input\n").to_stdout
      }
    end

    context "When user input: PLACE 0,0,NORTH then MOVE then REPORT" do
      it{
        @a.actions("PLACE",["0,0,NORTH"])
        @a.actions("MOVE",[])
        expect{@a.actions("REPORT",[])}.to \
          output("Output: 0,1,NORTH\n").to_stdout
      }
    end

    context "When user input: PLACE 0,0,NORTH then LEFT then REPORT" do
      it{
        @a.actions("PLACE",["0,0,NORTH"])
        @a.actions("LEFT",[])
        expect{@a.actions("REPORT",[])}.to \
          output("Output: 0,0,WEST\n").to_stdout
      }
    end
  end

end