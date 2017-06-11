require 'spec_helper'

describe Interface do
  context 'Launch method:' do
    subject(:interface) { Interface.new }

    it 'shows a welcome message' do
      stdout = -> { interface.help_message }
      expected_output = output(/Welcome To Toy Robot Simulator/).to_stdout
      expect(stdout).to expected_output
    end
  end
end
