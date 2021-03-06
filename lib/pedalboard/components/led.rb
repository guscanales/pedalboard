require 'dino/components/base_component'
require 'dino/components/led'

require_relative 'base_component'

module Pedalboard; module Components
  class Led < BaseComponent
    def light_if condition
      condition ? on : off
    end

    def off
      dino_component.send :off
    end

    def on
      dino_component.send :on
    end

  private
    def dino_component
      @dino_component ||= Dino::Components::Led.new(
        pin: pin,
        board: pedalboard.board
      )
    end
  end
end; end
