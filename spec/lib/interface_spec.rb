require 'spec_helper'

describe '#InterfaceClass:' do

  describe 'Initilize the robot interface' do
    it 'It is a Robot instance' do
      expect(Interface.new).to be_an_instance_of Interface
    end
  end

  describe 'Launch method:' do
    before :each do
      @a = Interface.new
    end

    it 'Able to show welcome message' do
      expect { @a.welcome_message }.to \
      output(/Welcome To Toy Robot Simulator/).to_stdout
    end
  end

  describe 'Action Method:' do
    before :each do
      @a = Interface.new
    end

    it 'When user input: PLACE 1,1,NORTH then REPORT' do
      @a.actions('PLACE', ['1,1,NORTH'])
      expect { @a.actions('REPORT', []) }.to \
        output("Output: 1,1,NORTH\n").to_stdout
    end

    it 'When invalid user input: PLACE ' do
      expect { @a.actions('PLACE', []) }.to \
      output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE 0,0' do
      expect { @a.actions('PLACE', ['0,0']) }.to \
      output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE NORTH,0,0' do
      expect { @a.actions('PLACE', ['NORTH,0,0']) }.to \
      output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE -1,-2,NORTH' do
      expect { @a.actions('PLACE', ['-1,-2,NORTH']) }.to \
      output("Invalid Input\n").to_stdout
    end

    it 'When user input: PLACE 0,0,NORTH then MOVE then REPORT' do
      @a.actions('PLACE', ['0,0,NORTH'])
      @a.actions('MOVE', [])
      expect { @a.actions('REPORT', []) }.to \
      output("Output: 0,1,NORTH\n").to_stdout
    end

    it 'When user input: PLACE 0,0,NORTH then LEFT then REPORT' do
      @a.actions('PLACE', ['0,0,NORTH'])
      @a.actions('LEFT', [])
      expect { @a.actions('REPORT', []) }.to \
      output("Output: 0,0,WEST\n").to_stdout
    end
  end
end
