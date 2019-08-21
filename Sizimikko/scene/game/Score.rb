require "dxruby"

class Score
    private
        @meter
        @ENDMETER
        @ENDTIME
        @font

        def clacMeter()
            @meter = ((Window.running_time - @STTIME) / @ENDTIME) * @ENDMETER   #ゲーム時間５分程度のため逆算
            @meter = format("%.1f" , @meter)
        end
        

    public
        def initialize()
            @STTIME = Window.running_time
            @meter = 0
            @ENDMETER = 210 #津和野から松江まで大体
            @ENDTIME = 1 * 60 * 1000#終わるミリ秒
            @font = Font.new(30)
        end

        def update()
            clacMeter()#メータ加算 
        end

        def draw()
            Window.draw_font(Window.width - @font.get_width("#{@meter}")-100,@font.size(), "#{@meter} km", @font, {:color => [255,0,0]})
        end
        
        def getMeter()
            return @meter
        end

        def meterEndCheck()#エラーあり
            if @meter >= @ENDMETER
                return true
            end
            return false
        end

end