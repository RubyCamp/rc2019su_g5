require "dxruby"
require_relative "./Obstacle.rb"

class Background
    private
        @backImage  #背景画像
        @imWindow   #メッセージウィンドウ
        @placeName  #地名表示用文字列
        @font
        @progress
        def initImage
            #背景画像の追加
            @backImage =[]
            @backImage[0] = Image.load("resource/back/forest.jpg")
            @backImage[1] = Image.load("resource/back/ginzan2.png")
            @backImage[2] = Image.load("resource/back/sinziko3.jpg")
            @backImage[3] = Image.load("resource/back/matsuejou.jpg")

            #メッセージウィンドウの追加
            @imWindow = []
            @imWindow[0] = Image.load("resource/window.png")
            @imWindow[1] = Image.load("resource/window2.png")
           
        end
        def initString
            #文字列の追加
            @placeName = []
            @placeName[0] = "津和野"
            @placeName[1] = "#{@placeName[0]}　～　石見"
            @placeName[2] = "#{@placeName[1]}　～　出雲"
            @placeName[3] = "#{@placeName[2]}　～　松江"
        end

    public
    def initialize()
        @progress = 0
        @font = Font.new(32)
        initImage()
        initString()
    end
    
    def update()
    end
    def draw()
        Window.draw(0,0,@backImage[@progress])#画像を縮小して描画
        Window.draw(5,5,@imWindow[0])
        Window.draw(0, Window.height - 50,@imWindow[1])
        Window.draw_font(30, Window.height - 40,"Wキーで上にジャンプ", @font, {:color => [0,0,0]})
        Window.draw_font(100,18,"#{@placeName[@progress]}",@font, {:color => [0,100,100]})

    end

    def setProggress(progress)
        @progress = progress
    end
 
end