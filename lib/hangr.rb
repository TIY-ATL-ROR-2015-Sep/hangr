require "hangr/version"
require "hangr/init_db"
require "pry"

module Hangr
  # Your code goes here...

  class Player < ActiveRecord::Base
  end
end

binding.pry
