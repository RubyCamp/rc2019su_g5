require "dxruby"

class Obstacle < Sprite
    private
        @GROUND         #地面の位置
        @speed  #障害物のスピード

        def move()#左方向への移動処理
            self.x = self.x - @speed
        end
        
    public
    def initialize(imagepath, speed)#画像名（拡張子付き）を引数に
        super
        @name = imagepath
        @GROUND =Window.height - 100 #地面の位置
        self.image = Image.load("resource/#{imagepath}")
        self.x = Window.width + self.image.width
        self.y = @GROUND - self.image.height()
        @speed = speed
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

    def setsky()
        self.y -= self.image.height() + 20
    end
end