require "dxruby"
require_relative  "./Player.rb"
require_relative  "../Scene.rb"
require_relative  "./ObstacleSet.rb"
require_relative  "../SceneManager.rb"
require_relative  "./Background.rb"
require_relative  "./Score.rb"
class Game < SceneIF
    private
        @background #背景のクラス
        @player     #プレイヤークラス 
        @obstacleset   #障害物クラス
        @score      #スコアクラス
        @clearflag
        def collisionCheck()#衝突判定　衝突していたらtrue
            @player.check(@obstacleset.getObstacles()).each do|t|
                return true
            end
            return false
        end



    public
        def initialize()#初期化処理
            @background = Background.new
            @player = Player.new
            @obstacleset = ObstacleSet.new
            @score = Score.new
            @clearflag = false
        end
        def update()#計算処理
            @background.update()
            @player.update()
            @obstacleset.update()
            @score.update()
            #衝突判定
            if collisionCheck() 
                @clearflag = false
                SceneManager.setNextScene(:RESULT)#衝突していたらリザルト画面へ移行
            elsif @score.meterEndCheck()
                @clearflag = true
                SceneManager.setNextScene(:RESULT)#衝突していたらリザルト画面へ移行
            end
            @background.changeScreen(@score.clacTime())

        end
        def draw()#描画処理
            @background.draw()
            @player.draw()
            @obstacleset.draw()
            @score.draw()
        end
        def getClearFlag()
            return @clearflag
        end
        def getMeter()
            return @score.getMeter()
        end
end