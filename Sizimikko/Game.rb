require "dxruby"
require "./Player.rb"
require "./Scene.rb"
require "./Obstacle.rb"
class Game < SceneIF
    
    def initialize()#初期化処理
        @player = Player.new
        @obstacle = Obstacle.new
    end
    def update()#計算処理
        @player.update()
        @obstacle.update()

    end
    def draw()#描画処理
        @player.draw()
        @obstacle.draw()
    end
end