require_relative "./Obstacle.rb"

class ObstacleSet
    private
        @obstacles#集合をどう管理するかは聞いてみる
    public
        def initialize()
            @obstacles = []
            @prevtime = Window.running_time;
            
        end
        def update()
            @obstacles.unshift()
            t = Window.running_time;
            if (t - @prevtime >= 3000)
                @obstacles[@obstacles.size] = Obstacle.new("rock.png")
                @prevtime = t
            end 
            @obstacles.size.times do |i|           
                @obstacles[i].update
            end
            #puts(@obstacles)

           
            @obstacles.size.times do |i| 
                if(@obstacles[i].offScreencheck() == true) 
                    @obstacles.shift(1)
                end
            end
                

            
            

        end

        def draw()
            @obstacles.size.times do |i|           
                @obstacles[i].draw
            end
        end
end
    
