require "dxruby"

class Obstacle < Sprite
    def initialize()
        super
        @GROUND =300
        self.x = 1024
        self.y = @GROUND
        @Obstaclespeed = 5
        self.image = Image.load("resource/rock.png")

    end
    def update()
            self.x = self.x - @Obstaclespeed
    end

    def hit()

    end
end