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
                if t.getName() == "labo.png"
                    return 1
                else
                    return 2
                end
            end
            return 0
        end

        def gameEndCheck()
            f = collisionCheck() 
            if f == 1
                @clearflag = true
                SceneManager.setNextScene(:RESULT)#衝突していたらリザルト画面へ移行
            elsif f == 2
                @clearflag = false
                SceneManager.setNextScene(:RESULT)#衝突していたらリザルト画面へ移行
            end
    

        end



    public
        def initialize()#初期化処理
            @bgm = Sound.new("resource/music/bgm.wav")
            @bgm.set_volume(200)
            
            @background = Background.new
            @player = Player.new
            @obstacleset = ObstacleSet.new
            @score = Score.new
            @clearflag = false
            @flag = true
        end
        def update()#計算処理
            if @flag
             @bgm.play()
             @flag = false
            end
            @background.update()
            @player.update()
            @score.update()
            @obstacleset.update(@score.getMeter())
            
            @background.changeScreen(@score.calcTime())#進んだ距離に応じて背景を変更する
            @obstacleset.changeProggress(@score.calcTime())
            gameEndCheck()#ゲームの終了チェック
            
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