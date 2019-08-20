require "dxruby"
require_relative  "./scene/SceneManager.rb"


Window.width = 1024
Window.height = 768

Window.loop do
    SceneManager.changeScene()
    SceneManager.update()
    SceneManager.draw()
    #60FPS
end