require "dxruby"

class Obstacle < Sprite
    private
        @GROUND
        @Obstaclespeed

        def move()
            self.x = self.x - @Obstaclespeed
        end
        
    public
    def initialize()
        super
        @GROUND =300 #地面の位置
        @Obstaclespeed = 5
        self.image = Image.load("resource/rock.png")
        self.x = Window.width + self.image.width
        self.y = @GROUND

    end

    def update()
        move()
    end

    def hit()

    end
end