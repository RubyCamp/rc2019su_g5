require "dxruby"

class Player < Sprite
    private
        @GROUND = 300   #地面の位置
        @FRAMETIME = 5  #アニメーションが切り替わるフレーム数
        @jumppower      #ジャンプする力  
        @imwidth        #画像幅
        @imheight       #画像高さ
        @baseimage      #一枚画像
        @image          #切り取った画像を入れる配列
        @animec         #アニメーションに使うカウンタ
        @jflag          #ジャンプしているかどうかboolean
        @y_prev         #ジャンプ用　前の座標保持
        @y_temp         #ジャンプ用　前の座標保持

        def jump()
            if(@jflag == true)
                @y_temp = self.y
                self.y +=(self.y-@y_prev)+1
                @y_prev = @y_temp
                if(self.y >= @GROUND)
                    self.y = @GROUND
                    @jflag = false
                    
                end
            end
            if(Input.key_push?(K_W) && @jflag == false)
                @jflag = true
                @y_prev = self.y
                self.y = self.y-@jumppower
            end
        end

        def animetion()
            @animec += 1
            @animec  = @animec % (@FRAMETIME * @image.size())
        end
    public
    def initialize()#初期化処理
        @GROUND = 300 #地面の位置
        #座標
        self.x = 100
        self.y = @GROUND
        #ジャンプする力
        @jumppower = 10
        #画像の１マスのサイズ
        @imwidth = 32
        @imheight = 32
  
        self.image = @image#Spriteクラスなので追加
        #ジャンプしているかどうか
        @jflag = false
        #画像
        @baseimage = Image.load("resource/testplayer.png")
        #アニメーション用の画像切り抜き
        @image = []
        3.times do |i|
            @image[i] = @baseimage.slice(@imwidth * i, @imheight * 2, @imwidth, @imheight)
        end
        #アニメーション用のカウンタ
        @animec = 0
        #アニメーションが切り替わるフレーム数
        @FRAMETIME = 5
        
    end
    def update()#計算処理
        jump()
        animetion()
    end
    def draw()#描画処理
        Window.draw(self.x,self.y,@image[@animec/@FRAMETIME])
    end
end