require "dxruby"

class Score
    private
        @meter
        @ENDMETER
        @ENDTIME
        @font

        def clacMeter()
            @meter = clacTime() * @ENDMETER   #ゲーム時間５分程度のため逆算
            @meter = format("%3.1f" , @meter)
        end
        

    public
        def initialize()
            @STTIME = Window.running_time
            @meter = 0
            @ENDMETER = 210 #津和野から松江まで大体
            #@ENDTIME = 1 * 60 * 1000#終わるミリ秒
            @ENDTIME = 30 * 500
            @font = Font.new(32)
            @imwindow = Image.load("resource/window.png")
        end

        def update()
            clacMeter()#メータ加算 
        end

        def draw()
            offset = @font.get_width("#{@meter}") + 80 
            Window.draw_scale(Window.width - 195, 5, @imwindow, 0.3, 1, 0, 0)#メッセージウィンドウ描画
            Window.draw_font(Window.width - offset, @font.size() / 2, "#{@meter} km", @font, {:color => [255,0,0]})
        end
        
        def getMeter()
            return @meter
        end

        def meterEndCheck()#目的地についているかどうかを判定する
            if @meter.to_i >= @ENDMETER
                return true
            end
            return false
        end

        def clacTime()
            return (Window.running_time - @STTIME) / @ENDTIME
        end

end