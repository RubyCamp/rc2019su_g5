require "dxruby"

class Obstacle < Sprite
    private
        @GROUND         #地面の位置
        @obstaclespeed  #障害物のスピード

        def move()#左方向への移動処理
            self.x = self.x - @obstaclespeed
        end
        
    public
    def initialize(imagepath)#画像名（拡張子付き）を引数に
        super
        @name = imagepath
        @GROUND =Window.height - 100 #地面の位置
        @obstaclespeed = 10
        self.image = Image.load("resource/#{imagepath}")
        self.x = Window.width + self.image.width
        self.y = @GROUND - self.image.height()
    end
    def offScreencheck()
        if (self.x <= 0 - self.image.width)
            return true
        end
        return false
    end

    def update()
        move()
    end

    def hit()

    end

    def getName()
        return @name
    end

    def objspeed()
        @obstaclespeed = 5
    end
end