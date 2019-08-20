require "dxruby"
require "./Player.rb"
require "./Scene.rb"
require "/.Obstacle.rb"
class Game < SceneIF
    
    def initialize()#初期化処理
        @player = Player.new
    end
    def update()#計算処理
        @player.update()

    end
    def draw()#描画処理
        @player.draw()
    end
end