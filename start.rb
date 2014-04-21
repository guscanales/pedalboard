$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'bundler/setup'
require 'dino'
require 'micromidi'
require 'pedalboard'

pedalboard = Pedalboard.create do
  led = Dino::Components::Led.new(
    pin: 13, board: board
  )

  pedal pin: 7,
    press: ->{ next_patch; led.send :on }

  pedal pin: 8,
    press: -> { previous_patch; led.send :off }
end

sleep
