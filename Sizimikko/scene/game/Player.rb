require "dxruby"

class Player < Sprite
    private
        @GROUND = 300   #地面の位置
        @FRAMETIME = 5  #アニメーションが切り替わるフレーム数
        @jumppower      #ジャンプする力  
        @IMWIDTH        #画像幅
        @IMHEIGHT       #画像高さ
        @baseimage      #一枚画像
        @image          #切り取った画像を入れる配列
        @animec         #アニメーションに使うカウンタ
        @jflag          #ジャンプしているかどうかboolean
        @y_prev         #ジャンプ用　前の座標保持
        @y_temp         #ジャンプ用　前の座標保持

        def jump()#ジャンプ処理
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
                @se.play()
                @jflag = true
                @y_prev = self.y
                self.y = self.y-@jumppower
            end
        end

        def animetion()#アニメーション（走ってるように見せる)
            @animec += 1
            @animec  = @animec % (@FRAMETIME * @image.size())
        end
    public
    def initialize()#初期化処理
        super
        @se = Sound.new("resource/music/jump2.wav")
        @se.set_volume(200)

        #ジャンプする力
        @jumppower = 20
        #画像の１マスのサイズ
        @IMWIDTH = 96
        @IMHEIGHT = 96
        @GROUND = Window.height - 100 - @IMHEIGHT #地面の位置

        #座標
        self.x = 100
        self.y = @GROUND
        
        #ジャンプしているかどうか
        @jflag = false
        #画像
        @baseimage = Image.load("resource/player.png")
        #アニメーション用の画像切り抜き
        @image = []
        3.times do |i|
            @image[i] = @baseimage.slice(@IMWIDTH * i, @IMHEIGHT * 2, @IMWIDTH, @IMHEIGHT)
        end

        self.image = Image.load("resource/playhit.png")#当たり判定を追加
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

    def hit(obj)

    end
end