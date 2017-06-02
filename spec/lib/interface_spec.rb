require 'spec_helper'

describe Interface do
  context 'Launch method:' do
    subject(:interface) { Interface.new }

    it 'shows a welcome message' do
      expect { interface.welcome_message }.to \
        output(/Welcome To Toy Robot Simulator/).to_stdout
    end
  end

  context '#action' do
    subject(:interface) { Interface.new }

    it 'When user input: PLACE 1,1,NORTH then REPORT' do
      interface.actions('PLACE', ['1,1,NORTH'])
      expect { interface.actions('REPORT', []) }.to \
        output("Output: 1,1,NORTH\n").to_stdout
    end

    it 'When invalid user input: PLACE ' do
      expect { interface.actions('PLACE', []) }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE 0,0' do
      expect { interface.actions('PLACE', ['0,0']) }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE NORTH,0,0' do
      expect { interface.actions('PLACE', ['NORTH,0,0']) }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'When invalid user input: PLACE -1,-2,NORTH' do
      expect { interface.actions('PLACE', ['-1,-2,NORTH']) }.to \
        output("Invalid Input\n").to_stdout
    end

    it 'When user input: PLACE 0,0,NORTH then MOVE then REPORT' do
      interface.actions('PLACE', ['0,0,NORTH'])
      interface.actions('MOVE', [])
      expect { interface.actions('REPORT', []) }.to \
        output("Output: 0,1,NORTH\n").to_stdout
    end

    it 'When user input: PLACE 0,0,NORTH then LEFT then REPORT' do
      interface.actions('PLACE', ['0,0,NORTH'])
      interface.actions('LEFT', [])
      expect { interface.actions('REPORT', []) }.to \
        output("Output: 0,0,WEST\n").to_stdout
    end
  end
end
