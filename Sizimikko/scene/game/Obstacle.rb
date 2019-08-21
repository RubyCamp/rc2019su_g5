require "dxruby"

class Obstacle < Sprite
    private
        @GROUND         #地面の位置
        @Obstaclespeed  #障害物のスピード

        def move()#左方向への移動処理
            self.x = self.x - @Obstaclespeed
        end
        
    public
    def initialize(imagepath)#画像名（拡張子付き）を引数に
        super
        @GROUND =Window.height - 200 #地面の位置
        @Obstaclespeed = 8
        self.image = Image.load("resource/#{imagepath}")
        self.x = Window.width + self.image.width
        self.y = @GROUND

    end

    def update()
        move()
    end

    def hit()

    end
end