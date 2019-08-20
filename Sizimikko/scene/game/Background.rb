require "dxruby"

class Background
    private
        @image
    public
    def initialize()
        @image = Image.load("resource/sky.jpg")
    end
    def update()
        
    end
    def draw()
        Window.draw_scale(0,0,@image,0.5,0.5,0,0)#画像を縮小して描画
    end
end