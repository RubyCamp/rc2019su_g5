require "dxruby"

class Background
    private
        @backimage  #背景画像
    public
    def initialize()
        @backimage =[]
        @index = 0
        @backimage[0] = Image.load("resource/pipo-battlebg002b.jpg")
        @backimage[1] = Image.load("resource/pipo-battlebg011b.jpg") 
    end
    def update()
         
        
        
        
    end
    def draw()
        Window.draw(0,0,@backimage[@index])#画像を縮小して描画
    end

    def changeScreen(progress)
        if (0.25 * (@index + 1) <= progress)
            @index +=1
        end
    end
end