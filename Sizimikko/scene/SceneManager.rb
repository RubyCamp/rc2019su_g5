require_relative  "./Scene.rb"
require_relative  "./title/Title.rb"
require_relative  "./game/Game.rb"
require_relative  "./result/Result.rb"


class SceneManager
    private
    @@scene = nil
    @@nextScene = :TITLE

    def initialize
    end

    def self.changeScene()  #シーン変更要求があれば変更する
        case @@nextScene
        when :TITLE
            @@scene = Title.new()
        when :GAME
            @@scene = Game.new()
        when :RESULT
            @@scene = Result.new()
        when nil

        else
            puts "シーンチェンジにない物を呼び出しています"
        end
        @@nextScene = nil
    end

    public
    def self.init()
        @@nextScene = nil
        @@scene = nil
        self.setNextScene(:TITLE)#初期画面の設定
    end
    def self.update()#シーンの計算処理呼び出し
        @@scene.update()
    end

    def self.draw()#シーンの描画処理呼び出し
        @@scene.draw()
    end
    def self.setNextScene(nextScene)#シーン変更要求を出す
        @@nextScene = nextScene
    end

end