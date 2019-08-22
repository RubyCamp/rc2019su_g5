require_relative "./Obstacle.rb"

class ObstacleSet
    private
        @obstacles


    public
        def initialize()
            @obstacles = []
            @imagename = []
            @imagename[0] = "dozyousukui.png"
            @imagename[1] = "rock.png"
            @imagename[2] = "shijimi.png"
            @imagename[3] = "shijimi.png"
            @prevtime = Window.running_time;
            @time = 1000
            @progress = 0
        end

        def update(meter)
            t = Window.running_time;
            if ((t - @prevtime >= @time)  )
                if (meter.to_i <= 195)
                    @obstacles[@obstacles.size] = Obstacle.new(@imagename[@progress])
                    @prevtime = t
                    @time = rand(3) * 300 + 1000
                elsif @obstacles.size == 0
                @obstacles[@obstacles.size] = Obstacle.new("labo.png")
                @obstacles[0].objspeed()
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

        def changeProggress(progress)
            if (0.25 * (@progress + 1) <= progress)
                @progress +=1
                if @progress > 3
                    @progress = 3
                end
            end
        end
end
    
