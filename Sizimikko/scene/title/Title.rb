require_relative  "../Scene.rb"
require_relative  "../SceneManager.rb"

class Title
    private 
        @font
    public
    def initialize()
        @font = Font.new(32)
    end
    def update()
        if Input.key_push?(K_A) then
            SceneManager.setNextScene(:GAME)
        end
    end
    def draw()
        Window.draw_font(100,100,"タイトル画面です aボタンでゲーム画面へ", @font)
    end

end