require "dxruby"
require "./Player.rb"
require "./Scene.rb"
require "./Obstacle.rb"
require "./SceneManager.rb"
class Game < SceneIF
    
    def initialize()#初期化処理
        @player = Player.new
        @obstacle = Obstacle.new
    end
    def update()#計算処理
        @player.update()
        @obstacle.update()
        if @player === @obstacle#テスト用衝突判定
            SceneManager.setNextScene(:TITLE)
        end


    end
    def draw()#描画処理
        @player.draw()
        @obstacle.draw()
    end
end