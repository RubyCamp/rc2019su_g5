require "dxruby"
require_relative  "../Scene.rb"
require_relative  "../SceneManager.rb"

class Result < SceneIF
    private
        @IMWIDTH    #１マス当たりの画像幅
        @IMHEIGHT   #１マス当たりの画像高さ
        @game

    public
        def initialize(clearflag, meter)
            if clearflag
            @game = GameClear.new()
            elsif
            @game = GameOver.new(meter)
            end
            
        end

        def update()
            @game.update()
        end

        def draw()
            @game.draw()

        end
end

class GameClear
    def initialize()
        @font = Font.new(70)
        @subfont = Font.new(30)
        @backimage = Image.load("resource/sky.jpg")
        @IMWIDTH = 96
        @IMHEIGHT = 96
        @image = Image.load("resource/player.png")
        @image = @image.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
        @fuki = Image.load("resource/fuki.png")
    end
    def update()

    end
    def draw()
        Window.draw_scale(0,0,@backimage,0.5,0.5,0,0)
        Window.draw_font(Window.width/2 - @font.get_width("GAME CLEAR")/2, Window.height/2 - @font.size(),"GAME CLEAR", @font)
        Window.draw_scale(100,Window.height - 100, @image, 2.5, 2.5)
        Window.draw_scale(230,Window.height - 300,@fuki, -1,0.6)
        Window.draw_font(300,Window.height - 150,"生まっつんに会えたニャン", @subfont, {:color => [0,0,0]})
    end

end

class GameOver
    private
        @meter
    public
        def initialize(meter)
            @IMWIDTH = 96
            @IMHEIGHT = 96
            @image = Image.load("resource/player.png")
            @image = @image.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
            @fuki = Image.load("resource/fuki.png")
            @meter = meter
            @font = Font.new(70)
            @subfont = Font.new(30)
        end
        def update()

        end
        def draw()
            Window.draw_scale(100,Window.height - 100, @image, 2.5, 2.5)
            Window.draw_scale(200,Window.height - 300,@fuki, -1,0.6)
            Window.draw_font(Window.width/2 - @font.get_width("GAME OVER")/2, Window.height/2 - @font.size(),"GAME OVER", @font)
            Window.draw_font(300,Window.height - 150,"#{@meter} km進みました。", @subfont, {:color => [0,0,0]})
            Window.draw_font(300,Window.height - 110,"ゴールまで頑張りましょう", @subfont, {:color => [0,0,0]})

        end

end
