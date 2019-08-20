class Player
    def initialize()#初期化処理
        @x = 100
        @y = 100
        @imwidth = 32
        @imheight = 32
        @baseimage = Image.load("resource/testplayer.png")
        @image = @baseimage.slice(@imwidth * 0, @imheight * 2, @imwidth, @imheight)
    end
    def update()#計算処理
        

    end
    def draw()#描画処理
        Window.draw(@x,@y,@image)
    end
end