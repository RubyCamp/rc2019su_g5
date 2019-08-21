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
        @cycle = 3000.0
        @twopi = 6.28
        @font = Font.new(72 ,"",{:weight => true})
        @subfont = Font.new(50)
        @infofont = Font.new(27)
        @TITLE = "しまねのねこの冒険"
        @SUBTITLE = "～Matzに会いに～"
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
        Window.draw_font(Window.width/2-@font.get_width(@TITLE)/2, 200, @TITLE, @font)
        Window.draw_font(Window.width/2-@subfont.get_width(@SUBTITLE)/2, 300, @SUBTITLE, @subfont)
        Window.draw_font(Window.width/2-@infofont.get_width(@INFO)/2, Window.height - 200,@INFO, @infofont,{alpha: @alpha})
    end
    def changeAlpha()
        t = Window.running_time;
        @alpha = (Math.sin(t % @cycle / @cycle * @twopi) * 0.42 + 0.58) * 255;
    end

end