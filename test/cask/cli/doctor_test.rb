require 'test_helper'
require 'cask/version'

describe Cask::CLI::Doctor do
  it 'displays some nice info about the environment' do
    out, err = capture_io do
      Cask::CLI::Doctor.run
    end
    # no point in trying to match more of this environment-specific info
    out.must_match /\A==> OS X Release:/
  end

  it "raises an exception when arguments are given" do
    lambda {
      Cask::CLI::Doctor.run('argument')
    }.must_raise ArgumentError
  end
end
