require "dxruby"
require_relative  "../Scene.rb"
require_relative  "../SceneManager.rb"

class Result < SceneIF
    private
        @image
        @IMWIDTH    #１マス当たりの画像幅
        @IMHEIGHT   #１マス当たりの画像高さ
    public
        def initialize()
            @IMWIDTH = 32
            @IMHEIGHT = 32
            @image = Image.load("resource/testplayer.png")
            @image = @image.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
        end

        def update()

        end

        def draw()
            Window.draw(200,Window.height/2,@image)
        end
end
