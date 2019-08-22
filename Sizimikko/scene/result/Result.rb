require "dxruby"
require_relative  "../Scene.rb"
require_relative  "../SceneManager.rb"

class Result < SceneIF
    private
        @IMWIDTH    #１マス当たりの画像幅
        @IMHEIGHT   #１マス当たりの画像高さ
        @game

        def changeAlpha()
            t = Window.running_time;
            @alpha = (Math.sin(t % @cycle / @cycle * @twopi) * 0.42 + 0.58) * 255;
        end
    public
        def initialize(clearflag, meter)
            @cycle = 3000.0
            @twopi = 6.28
            @alpha = 0
            if clearflag
            @game = GameClear.new()
            elsif
            @game = GameOver.new(meter)
            end
            @INFO = "qキーでタイトルへ"
            @infofont = Font.new(27)
        end

        def update()
            changeAlpha()
            @game.update()
            if Input.key_push?(K_Q) then
                SceneManager.setNextScene(:TITLE)
            end
        end

        def draw()
            @game.draw()
             Window.draw_font(Window.width/2-@infofont.get_width(@INFO)/2, Window.height - 300,@INFO, @infofont,{ alpha: @alpha})
        end
end

class GameClear
    def initialize()
        @font = Font.new(70)
        @subfont = Font.new(30)
        @backimage = Image.load("resource/back/sky.jpg")
        @IMWIDTH = 96
        @IMHEIGHT = 96
        @matzim = Image.load("resource/matz.png")
        @catim = Image.load("resource/player.png")
        @catim = @catim.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
        @fuki = Image.load("resource/fuki.png")
    end
    def update()

    end
    def draw()
        Window.draw(0,0,@backimage)
        Window.draw_font(Window.width/2 - @font.get_width("GAME CLEAR")/2, Window.height/2 - @font.size(),"GAME CLEAR", @font)
        Window.draw_scale(100,Window.height - 100, @catim, 2.5, 2.5)
        Window.draw(Window.width - 220,Window.height - 250, @matzim)
        Window.draw_scale(230,Window.height - 300,@fuki, -1,0.6)
        Window.draw_font(300,Window.height - 150,"生Matzに会えたニャン", @subfont, {:color => [0,0,0]})
    end

end

class GameOver
    private
        @meter
    public
        def initialize(meter)
            @IMWIDTH = 96
            @IMHEIGHT = 96
            @catim = Image.load("resource/player.png")
            @catim = @catim.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
            @fuki = Image.load("resource/fuki.png")
            @meter = meter
            @font = Font.new(70)
            @subfont = Font.new(30)
        end
        def update()

        end
        def draw()
            Window.draw_scale(100, Window.height - 100, @catim, 2.5, 2.5)
            Window.draw_scale(200,Window.height - 300,@fuki, -1,0.6)
            Window.draw_font(Window.width/2 - @font.get_width("GAME OVER")/2, Window.height/2 - @font.size(),"GAME OVER", @font)
            Window.draw_font(300,Window.height - 150,"#{@meter} km進みました。", @subfont, {:color => [0,0,0]})
            Window.draw_font(300,Window.height - 110,"ゴールまで頑張りましょう", @subfont, {:color => [0,0,0]})
        end

end
