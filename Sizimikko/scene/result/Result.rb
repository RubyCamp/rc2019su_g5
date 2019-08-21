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
                
            end
            @game = GameOver.new(meter)
            
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
        

    end
    def update()

    end
    def draw()

    end

end

class GameOver
    private
        @meter
    public
        def initialize(meter)
            @backimage = Image.load("resource/gameover.jpg")#ゲームオーバー画面のロード
            @IMWIDTH = 96
            @IMHEIGHT = 96
            @image = Image.load("resource/player.png")
            @image = @image.slice(@IMWIDTH * 1, @IMHEIGHT * 0, @IMWIDTH, @IMHEIGHT)
            @fuki = Image.load("resource/fuki.png")
            @meter = meter
            @font = Font.new(30)
        end
        def update()

        end
        def draw()
            Window.draw(0, 0, @backimage)
            Window.draw_scale(100,Window.height - 100, @image, 2.5, 2.5)
            Window.draw_scale(200,Window.height - 300,@fuki, -1,0.6)
            Window.draw_font(300,Window.height - 150,"#{@meter} km進みました。", @font)
            Window.draw_font(300,Window.height - 110,"松江まで頑張りましょう", @font)

        end

end
