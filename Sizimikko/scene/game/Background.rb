require "dxruby"

class Background
    private
        @backimage  #背景画像
    public
    def initialize()
        @backimage =[]
        @index = 0
        @font = Font.new(32)
        #背景画像の追加
        @backimage[0] = Image.load("resource/back/forest.jpg")
        @backimage[1] = Image.load("resource/back/ginzan2.png")
        @backimage[2] = Image.load("resource/back/sinziko2.jpg")
        @backimage[3] = Image.load("resource/back/matsuejou.jpg")
        @backimage[4] = @backimage[3]
        #文字列の追加
        @string = []
        @string[0] = "津和野"
        @string[1] = "#{@string[0]}　～　石見"
        @string[2] = "#{@string[1]}　～　出雲"
        @string[3] = "#{@string[2]}　～　松江"
        @string[4] = @string[3]
        #メッセージウィンドウの追加
        @imwindow = []
        @imwindow[0] = Image.load("resource/window.png")
        @imwindow[1] = Image.load("resource/window2.png")

    end
    
    def update()

    end
    def draw()
        Window.draw(0,0,@backimage[@index])#画像を縮小して描画
        Window.draw(5,5,@imwindow[0])
        Window.draw(0, Window.height - 50,@imwindow[1])
        Window.draw_font(30, Window.height - 40,"Wキーで上にジャンプ", @font, {:color => [0,0,0]})
        Window.draw_font(100,18,"#{@string[@index]}",@font, {:color => [0,100,100]})
    end

    def changeScreen(progress)
        if (0.25 * (@index + 1) <= progress)
            @index +=1
        end
    end
end