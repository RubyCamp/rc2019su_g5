require_relative  "../Scene.rb"
require_relative  "../SceneManager.rb"

class Title
    private 
        @font
        @infofont
        @TITLE
        @INFO
        @alpha
    public
    def initialize()
        @backimage = Image.load("resource/back/title.png")
        @cycle = 3000.0
        @twopi = 6.28
        @infofont = Font.new(27)
        @INFO = "aボタンでゲーム画面へ"
        @alpha = 0
    end
    def update()
        changeAlpha()
        if Input.key_push?(K_A) then
            SceneManager.setNextScene(:GAME)
        end
    end
    def draw()
        Window.draw(0, 0, @backimage)
        Window.draw_font(Window.width/2-@infofont.get_width(@INFO)/2, Window.height - 200,@INFO, @infofont,{:color => [0,0,0], alpha: @alpha})
    end
    def changeAlpha()
        t = Window.running_time;
        @alpha = (Math.sin(t % @cycle / @cycle * @twopi) * 0.42 + 0.58) * 255;
    end

end