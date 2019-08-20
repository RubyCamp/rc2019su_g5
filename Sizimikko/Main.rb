require "dxruby"
require "./Game.rb"

game = Game.new

Window.loop do
    #60FPS
    game.update()
    game.draw()
end