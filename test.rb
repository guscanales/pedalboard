require 'bundler/setup'
require 'dino'
require 'micromidi'

@output = UniMIDI::Output.gets

board = Dino::Board.new(Dino::TxRx::Serial.new)
led = Dino::Components::Led.new(pin: 13, board: board)
button1 = Dino::Components::Button.new(pin: 2, board: board)
button2 = Dino::Components::Button.new(pin: 4, board: board)

MIDI.using(@output) do
  button1.up do
    note 'c'
    puts 'button pressed'
    led.send :on
  end

  button1.down do
    off
    puts 'button released'
    led.send :off
  end

  button2.up do
    note 'e'
    puts 'button pressed'
    led.send :on
  end

  button2.down do
    off
    puts 'button released'
    led.send :off
  end
end

sleep
