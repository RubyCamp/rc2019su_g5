require "dxruby"

class Player
    def initialize()#初期化処理
        @GROUND = 300
        @FRAMETIME = 10
        @x = 100
        @y = @GROUND
        @jumppower = 10
        @imwidth = 32
        @imheight = 32
        @baseimage = Image.load("resource/testplayer.png")
        @image = @baseimage.slice(@imwidth * 0, @imheight * 2, @imwidth, @imheight)
        @jflag = false
        @image = []
        3.times do |i|
            @image[i] = @baseimage.slice(@imwidth * i, @imheight * 2, @imwidth, @imheight)
        end
        @animec = 0
    end
    def update()#計算処理
        if(@jflag == true)
            @y_temp = @y
            @y +=(@y-@y_prev)+1
            @y_prev = @y_temp
            if(@y >= @GROUND)
                @y = @GROUND
                @jflag = false
                
            end
        end
        if(Input.key_push?(K_W) && @jflag == false)
            @jflag = true
            @y_prev = @y
            @y = @y-@jumppower
        end
        @animec += 1
        @animec  = @animec % (@FRAMETIME * @image.size())
    end
    def draw()#描画処理
        Window.draw(@x,@y,@image[@animec/@FRAMETIME])
    end
end