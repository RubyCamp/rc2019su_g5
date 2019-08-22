require_relative "./Obstacle.rb"

class ObstacleSet
    private
        @obstacles


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
            t = Window.running_time;
            if ((t - @prevtime >= @time)  )
                if (meter.to_i <= 195)
                    if rand(4) == 0
                        tmp = @obstacles.size
                        @obstacles[tmp] = Obstacle.new(@simname, @speed)
                        @obstacles[tmp].setsky()
                    else
                        r = rand(4)
                        puts r
                        @obstacles[@obstacles.size] = Obstacle.new(@gimname[@progress][r], @speed)
                    end
                    @prevtime = t
                    @time = rand(3) * 300 + 1000
                elsif @obstacles.size == 0
                @obstacles[@obstacles.size] = Obstacle.new("labo.png", 5)
                end

            end 

            @obstacles.size.times do |i|           
                @obstacles[i].update
            end

            cnt = 0
            @obstacles.size.times do |i|
                if(@obstacles[i].offScreencheck() == true) 
                    cnt += 1
                end
            end
            @obstacles.shift(cnt)
                
        end

        def draw()
            @obstacles.size.times do |i|           
                @obstacles[i].draw
            end
        end

        def getObstacles()
            return @obstacles
        end

        def setProgress(progress)
            if@progress != progress
                @speed += 3
                @progress = progress
            end
        end

end
    
