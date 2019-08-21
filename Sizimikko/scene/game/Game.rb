require "dxruby"
require_relative  "./Player.rb"
require_relative  "../Scene.rb"
require_relative  "./ObstacleSet.rb"
require_relative  "../SceneManager.rb"
require_relative  "./Background.rb"
class Game < SceneIF
    private
        @background #背景のクラス
        @player     #プレイヤークラス 
        @obstacleset   #障害物クラス
    public
        def initialize()#初期化処理
            @background = Background.new
            @player = Player.new
            @obstacleset = ObstacleSet.new()
        end
        def update()#計算処理
            @background.update()
            @player.update()
            @obstacleset.update()
            if @player === @obstacle#テスト用衝突判定
                SceneManager.setNextScene(:RESULT)#次フレームでリザルト画面へ移行
            end


        end
        def draw()#描画処理
            @background.draw()
            @player.draw()
            @obstacleset.draw()
        end
end