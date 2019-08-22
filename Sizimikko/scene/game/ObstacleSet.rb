require_relative "./Obstacle.rb"

class ObstacleSet
    private
        @obstacles  #障害物たち
        @simname    #空にいる障害物の画像
        @gimname    #地面にいる障害物の画像
        @speed      #障害物全てのスピード
        @prevtime   #障害物を出現させた時刻を保持
        @time       #次の障害物が出現するまでの間隔   
        @progress   #現在のゲームの進捗を保持

        def addObstacle()
            r =rand(5)
            if r >= @gimname.size #地上の生物より大きいなら
                tmp = @obstacles.size
                @obstacles[tmp] = Obstacle.new(@simname, @speed)
                @obstacles[tmp].setsky()#空用ｙ座標移動
            else
                @obstacles[@obstacles.size] = Obstacle.new(@gimname[@progress][r], @speed)
            end
        end

    public
        def initialize()
            @obstacles = []
            @gimname = []
            @simname = "haku.png"
            @gimname[0] = ["dozyousukui.png", "dozyousukui.png","rbi.png", @simname]
            @gimname[1] = ["rock.png" ,"mag.png","rock.png", @simname]
            @gimname[2] = ["shijimi.png", "mag.png", "rbi.png", @simname]
            @gimname[3] = ["shijimi.png", "dozyousukui.png", "mag.png", @simname]
            
            @speed = 8

            @prevtime = Window.running_time;
            @time = 1000
            @progress = 0
        end

        def update(meter)
            nowtime = Window.running_time;
            if nowtime - @prevtime >= @time #障害物の間隔を空ける
                if meter.to_i <= 200  #200M以下なら障害物を出現させる
                    addObstacle()#障害物追加
                    @prevtime = nowtime #次の障害物用に現在の時刻を格納
                    @time = (rand(3) * 300) + 1300 #ランダムで間隔をあける
                elsif @obstacles.size == 0  #障害物が残っていないならゲームクリア用のラボを出現させる
                    @obstacles[@obstacles.size] = Obstacle.new("labo.png", 5)
                end

            end 
            cnt = 0#画面外に出ている障害物をカウント
            @obstacles.size.times do |i|           
                @obstacles[i].update                
                if(@obstacles[i].offScreencheck() == true) 
                    cnt += 1
                end
            end
            @obstacles.shift(cnt)#左からはじき出す
                
        end

        def draw()
            @obstacles.size.times do |i|           
                @obstacles[i].draw()
            end
        end

        def getObstacles()
            return @obstacles
        end

        def setProgress(progress)#現在の進捗をゲームクラスからセットする
            if @progress != progress
                @speed += 3
                @progress = progress
            end
        end

end
    
