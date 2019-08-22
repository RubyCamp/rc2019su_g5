require_relative "./Obstacle.rb"

class ObstacleSet
    private
        @obstacles
    public
        def initialize()
            @obstacles = []

            @prevtime = Window.running_time;
            @time = 1000
        end

        def update(meter)
            t = Window.running_time;
            if ((t - @prevtime >= @time)  )
                if (meter.to_i <= 180)
                @obstacles[@obstacles.size] = Obstacle.new("rock.png")
                @prevtime = t
                @time = rand(3) * 300 + 1000
                elsif @obstacles.size == 0
                @obstacles[@obstacles.size] = Obstacle.new("labo.png")
                @obstacles[@obstacles.size - 1].objspeed()
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
end
    
