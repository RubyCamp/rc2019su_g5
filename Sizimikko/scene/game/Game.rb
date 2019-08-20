require "dxruby"
require_relative  "./Player.rb"
require_relative  "../Scene.rb"
require_relative  "./Obstacle.rb"
require_relative  "../SceneManager.rb"
require_relative  "./Background.rb"
class Game < SceneIF
    private
        @background
        @player
        @obstacle
    public
        def initialize()#初期化処理
            @background = Background.new
            @player = Player.new
            @obstacle = Obstacle.new
        end
        def update()#計算処理
            @background.update()
            @player.update()
            @obstacle.update()
            if @player === @obstacle#テスト用衝突判定
                SceneManager.setNextScene(:RESULT)
            end


        end
        def draw()#描画処理
            @background.draw()
            @player.draw()
            @obstacle.draw()
        end
end