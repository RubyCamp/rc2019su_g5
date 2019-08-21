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
        @backimage[1] = Image.load("resource/back/ginzan.png")
        @backimage[2] = Image.load("resource/back/sinziko.jpg")
        @backimage[3] = Image.load("resource/back/sky.jpg")
        @backimage[4] = @backimage[3]
        #文字列の追加
        @string = []
        @string[0] = "津和野"
        @string[1] = "#{@string[0]}　～　石見銀山"
        @string[2] = "#{@string[1]}　～　出雲大社"
        @string[3] = "#{@string[2]}　～　松江城"
        @string[4] = @string[3]
        #メッセージウィンドウの追加
        @imwindow = Image.load("resource/window.png")

    end
    
    def update()

    end
    def draw()
        Window.draw(0,0,@backimage[@index])#画像を縮小して描画
        Window.draw(5,5,@imwindow)
        #Window.draw_font(30,20,"Wキーで上にジャンプ", @font)
        Window.draw_font(30,18,"#{@string[@index]}",@font, {:color => [0,100,100]})
    end

    def changeScreen(progress)
        if (0.25 * (@index + 1) <= progress)
            @index +=1
        end
    end
end