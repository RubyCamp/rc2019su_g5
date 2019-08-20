require "dxruby"
require_relative  "./scene/SceneManager.rb"


Window.width = 900
Window.height = 650

Window.loop do
    SceneManager.changeScene()
    SceneManager.update()
    SceneManager.draw()
    #60FPS
end